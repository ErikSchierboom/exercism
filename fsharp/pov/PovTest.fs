﻿module PovTest

open NUnit.Framework

open Pov

let x = "x"
let leaf v = mkGraph v []

let singleton = mkGraph x []
let flat = mkGraph "root" (List.map leaf ["a"; "b"; x; "c"])
let nested = mkGraph "level-0" [mkGraph "level-1" [mkGraph "level-2" [mkGraph "level-3" [mkGraph x []]]]]
let kids = mkGraph "root" [mkGraph x [mkGraph "kid-0" []; mkGraph "kid-1" []]]
let cousins = mkGraph "grandparent" [
                mkGraph "parent" [
                    mkGraph x [leaf "kid-a"; leaf "kid-b"]; 
                    (leaf "sibling-0"); 
                    (leaf "sibling-1")];
                    mkGraph "uncle" [
                        (leaf "cousin-0");
                        (leaf "cousin-1")]]

let singleton' = singleton
let flat' = mkGraph x [mkGraph "root" (List.map leaf ["a"; "b"; "c"])]
let nested' = mkGraph x [mkGraph "level-3" [mkGraph "level-2" [mkGraph "level-1" [mkGraph "level-0" []]]]]
let kids' = mkGraph x [mkGraph "kid-0" []; mkGraph "kid-1" []; mkGraph "root" []]
let cousins' = mkGraph x [
                leaf "kid-a";
                leaf "kid-b";
                mkGraph "parent" [
                    mkGraph "sibling-0" [];
                    mkGraph "sibling-1" [];
                    mkGraph "grandparent" [
                        mkGraph "uncle" [
                            mkGraph "cousin-0" [];
                            mkGraph "cousin-1" []]]]]

[<Test>]
let ``Reparent singleton`` () =
    Assert.That(fromPOV x singleton, Is.EqualTo(Some singleton'))

[<Test>]
let ``Reparent flat`` () =
    Assert.That(fromPOV x flat, Is.EqualTo(Some flat'))

[<Test>]
let ``Reparent nested`` () =
    Assert.That(fromPOV x nested, Is.EqualTo(Some nested'))

[<Test>]
let ``Reparent kids`` () =
    Assert.That(fromPOV x kids, Is.EqualTo(Some kids'))

[<Test>]
let ``Reparent cousins`` () =
    Assert.That(fromPOV x cousins, Is.EqualTo(Some cousins'))

[<Test>]
let ``Reparent from POV of non-existent node`` () =
    Assert.That(fromPOV x (leaf "foo"), Is.EqualTo(None))

[<Test>]
let ``Should not be able to find a missing node`` () =
    let nodes = [singleton; flat; kids; nested; cousins] |> List.map (fromPOV "NOT THERE")
    Assert.That(nodes, Is.All.EqualTo(None))

[<Test>]
let ``Cannot trace between un-connected nodes`` () =
    Assert.That(tracePathBetween x "NOT THERE" cousins, Is.EqualTo(None))

[<Test>]
let ``Can trace a path from x to cousin`` () = 
    Assert.That(tracePathBetween x "cousin-1" cousins, Is.EqualTo(Some ["x"; "parent"; "grandparent"; "uncle"; "cousin-1"]))

[<Test>]
let ``Can trace from a leaf to a leaf`` () =
    Assert.That(tracePathBetween "kid-a" "cousin-0" cousins, Is.EqualTo(Some ["kid-a"; "x"; "parent"; "grandparent"; "uncle"; "cousin-0"]))
