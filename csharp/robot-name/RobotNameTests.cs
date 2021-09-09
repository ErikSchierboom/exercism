using System.Collections.Generic;
using Xunit;

public class RobotNameTests
{
    private readonly Robot robot = new Robot();

    [Fact]
    public void Robot_has_a_name()
    {
        Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
    }

    [Fact]
    public void Name_is_the_same_each_time()
    {
        Assert.Equal(robot.Name, robot.Name);
    }

    [Fact]
    public void Different_robots_have_different_names()
    {
        var robot2 = new Robot();
        Assert.NotEqual(robot2.Name, robot.Name);
    }

    [Fact]
    public void Can_reset_the_name()
    {
        var originalName = robot.Name;
        robot.Reset();
        Assert.NotEqual(originalName, robot.Name);
    }

    [Fact]
    public void After_reset_the_name_is_valid()
    {
        robot.Reset();
        Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
    }

    [Fact]
    public void Robot_names_are_unique()
    {
        var names = new HashSet<string>();
        for (int i = 0; i < 10_000; i++) {
            var robot = new Robot();
            Assert.True(names.Add(robot.Name));
            Assert.Matches(@"^[A-Z]{2}\d{3}$", robot.Name);
        }
    }
}
