module RobotName

type Robot = { name: string }

module Array =
    let private r = System.Random()
    
    let random (arr: 'T[]) = arr.[r.Next(arr.Length)]
    
    let sample n (arr: 'T[]) = Array.init n (fun _ -> random arr)

let private generateName() =
    System.String(Array.append (Array.sample 2 [|'A'..'Z'|]) (Array.sample 3 [|'0'..'9'|]))

let mkRobot() = { name = generateName() }

let name robot = robot.name
let reset _ = mkRobot()
