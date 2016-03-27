// Include Fake library
#r "tools/FAKE/tools/FakeLib.dll"

open Fake
open Fake.FscHelper
open Fake.Testing.NUnit3

// Properties
let buildDir = getBuildParamOrDefault "buildDir" "./build/"
let testDll = buildDir @@ "Tests.dll"
let nunitFrameworkDll = "tools/NUnit/lib/nunit.framework.dll"

let implementationFiles`` () = !! "./**/*.fs" -- "./**/*Test*.fs" |> List.ofSeq
let testFiles`` () = !! "./**/*Test*.fs" |> List.ofSeq
let sourceFiles`` () = implementationFiles() @ testFiles() 
  
// Targets
Target "Clean" (fun _ ->
    CleanDir buildDir
)

Target "Build" (fun _ ->
  sourceFiles()
  |> List.ofSeq
  |> Fsc (fun p ->
           { p with Output = testDll
                    References = [nunitFrameworkDll]
                    FscTarget = Library })
)

Target "Test" (fun _ ->
    Copy buildDir [nunitFrameworkDll]
    
    [testDll]
    |> NUnit3 (fun p -> 
        { p with
            ShadowCopy = false })
)

Target "Default" (fun _ -> ())
  
"Clean"   
    ==> "Build"    
    ==> "Test"
    ==> "Default"
  
RunTargetOrDefault "Default"