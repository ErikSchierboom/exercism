open System.IO
open System.Diagnostics

let arg index =
    let args = fsi.CommandLineArgs
    match index < args.Length with 
    | false -> None
    | true -> args |> Array.skip index |> Array.tryHead

let uuidArgument = arg 1

let openInIdeArgument = 
    arg 2
    |> Option.map (fun arg -> arg <> "test")
    |> Option.defaultValue true

let runProcess processStartInfo =
    let newProcess = new Process()
    newProcess.StartInfo <- processStartInfo
    newProcess.Start() |> ignore
    newProcess.WaitForExit()
    newProcess

let runAndDisposeProcess processStartInfo =
    let newProcess = runProcess processStartInfo
    newProcess.Dispose()

let downloadSubmission uuid =
    let command = "exercism"
    let arguments = sprintf "d -u %s" uuid
    
    let processStartInfo = ProcessStartInfo(command, arguments)
    processStartInfo.UseShellExecute <- false
    processStartInfo.RedirectStandardOutput <- true
    processStartInfo.RedirectStandardError <- true

    use newProcess = runProcess processStartInfo
    newProcess.StandardOutput.ReadToEnd().Trim()

let enableAllTests directory =
    let removeSkipAttributeProperties testFile =
        let testFileContents = File.ReadAllText(testFile)
        let testFileContentsWithAllTestsEnabled = testFileContents.Replace("(Skip = \"Remove to run test\")", "")
        File.WriteAllText(testFile, testFileContentsWithAllTestsEnabled)

    Directory.EnumerateFiles(directory, @"*Test*")
    |> Seq.iter removeSkipAttributeProperties

let runAllTests directory =
    let processStartInfo = ProcessStartInfo("dotnet", "test")
    processStartInfo.UseShellExecute <- false
    processStartInfo.WorkingDirectory <- directory

    runAndDisposeProcess processStartInfo

let openInIDE directory =
    let processStartInfo = ProcessStartInfo("code", "-r .")
    processStartInfo.WorkingDirectory <- directory

    runAndDisposeProcess processStartInfo

let processUuid uuid =
    let directory = downloadSubmission uuid
    enableAllTests directory |> ignore
    runAllTests directory |> ignore
    if openInIdeArgument then openInIDE directory else ()

match uuidArgument with
| Some uuid -> processUuid uuid
| None -> failwith "No UUID specified"