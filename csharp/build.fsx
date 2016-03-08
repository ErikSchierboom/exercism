// Include Fake library
#r "tools/FAKE/tools/FakeLib.dll"

open Fake
open Fake.CscHelper
open Fake.Testing.NUnit3

// Properties
let buildDir = getBuildParamOrDefault "buildDir" "./build/"
let testDll = buildDir @@ "Tests.dll"
let nunitFrameworkDll = "tools/NUnit/lib/net45/nunit.framework.dll"
  
// Targets
Target "Clean" (fun _ ->
    CleanDir buildDir
)

Target "Build" (fun _ ->
  !! "./**/*.cs"
  |> List.ofSeq
  |> Csc (fun p ->
           { p with Output = testDll
                    References = [nunitFrameworkDll]
                    Target = Library })
)

Target "Test" (fun _ ->
    Copy buildDir [nunitFrameworkDll]
    
    [testDll]
    |> NUnit3 (fun p -> 
        { p with
            ShadowCopy = false })
)

Target "Default" (fun _ -> ())

// Dependencies
"Clean" 
    ==> "Build"    
    ==> "Test"
    ==> "Default"
  
RunTargetOrDefault "Default"