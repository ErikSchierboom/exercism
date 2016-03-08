﻿module RobotNameTest

open NUnit.Framework
open RobotName


type RobotNameTest() = 
    let robot = RobotName()
    
    [<Test>]
    member tests.``Robot has a name``() = StringAssert.IsMatch(@"\w{2}\d{3}", robot.Name)
    
    [<Test>]
    member tests.``Name is the same each time``() = Assert.That(robot.Name, Is.EqualTo(robot.Name))
    
    [<Test>]
    member this.``Different robots have different names``() = 
        let robot2 = RobotName()
        Assert.That(robot.Name, Is.Not.EqualTo(robot2.Name))
    
    [<Test>]
    member this.``Can reset the name``() = 
        let originalName = robot.Name
        robot.Reset()
        Assert.That(originalName, Is.Not.EqualTo(robot.Name))
