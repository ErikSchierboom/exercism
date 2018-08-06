open System.Net
open System.IO
open System.Diagnostics
open System.Text.RegularExpressions

let languageArgument =
    fsi.CommandLineArgs
    |> Array.tail
    |> Array.tryHead

let downloadUrl (url: string) =
    let request = WebRequest.CreateHttp(url)
    use response = request.GetResponse()
    use responseStream = response.GetResponseStream()
    use responseStreamReader = new StreamReader(responseStream)
    responseStreamReader.ReadToEnd()

let exercises language = 
    let configJsonUrl = sprintf "https://raw.githubusercontent.com/exercism/%s/master/config.json" language
    let configJsonContents = downloadUrl configJsonUrl

    Regex.Matches(configJsonContents, "{(.+?)}", RegexOptions.Singleline)
    |> Seq.cast<Match>
    |> Seq.map (fun x -> x.Groups.[1].Value)
    |> Seq.filter (fun x -> x.Contains("deprecated") |> not)
    |> Seq.map (fun x -> Regex.Match(x, "\"slug\": \"(.+)\"").Groups.[1].Value)
    |> Seq.toList

let downloadExercise language exercise =
    let command = "exercism"
    let arguments = sprintf "download --exercise=%s --track=%s" exercise language

    let processStartInfo = ProcessStartInfo(command, arguments)
    processStartInfo.UseShellExecute <- false
    processStartInfo.RedirectStandardOutput <- true
    processStartInfo.RedirectStandardError <- true

    use downloadProcess = new Process()
    downloadProcess.StartInfo <- processStartInfo
    downloadProcess.Start() |> ignore
    downloadProcess.WaitForExit()
    let downloadedToDirectory = downloadProcess.StandardOutput.ReadToEnd().Trim()

    printfn "Exercise %s downloaded to: %s" exercise downloadedToDirectory

let downloadExercises language =
    printfn "Downloading exercises for %s track..." language

    exercises language
    |> List.iter (downloadExercise language)

    printfn "Exercises downloaded"

match languageArgument with
| Some language -> downloadExercises language
| None -> failwith "No language specified"