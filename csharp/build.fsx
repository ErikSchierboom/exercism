// Include Fake library
#r "../packages/FAKE/tools/FakeLib.dll"

open Fake
open Fake.Testing.NUnit3

// Directories
let buildDir  = "./build/"

// Files
let solutionFile = "./Exercism.csharp.csproj"
let compiledOutput = buildDir @@ "Exercism.csharp.dll"

// Targets
Target "Clean" (fun _ ->
    CleanDirs [buildDir]
)

Target "Build" (fun _ ->
    MSBuildRelease buildDir "Build" [solutionFile]
    |> Log "MSBuild output: "
)

Target "Test" (fun _ ->
    if getEnvironmentVarAsBool "APPVEYOR" then
        [compiledOutput]
        |> NUnit3 (fun p -> { p with 
                                ShadowCopy = false
                                ToolPath = @"C:\Tools\NUnit3\bin\nunit3-console.exe"
                                ResultSpecs = ["myresults.xml;format=AppVeyor"] })
    else
        [compiledOutput]
        |> NUnit3 (fun p -> { p with 
                                ShadowCopy = false
                                ToolPath = "../packages/NUnit.ConsoleRunner/tools/nunit3-console.exe" })
)


// Build order
"Clean" 
  ==> "Build"
  ==> "Test"

// start build
RunTargetOrDefault "Test"