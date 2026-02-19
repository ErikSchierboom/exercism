package robot_simulator

import "core:testing"

@(test)
/// description = Create robot -> at origin facing north
test_create_robot__at_origin_facing_north :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, .North)

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.North)
}

@(test)
/// description = Create robot -> at negative position facing south
test_create_robot__at_negative_position_facing_south :: proc(t: ^testing.T) {

	robot := create_robot(-1, -1, Heading.South)

	testing.expect_value(t, robot.pos, Position{-1, -1})
	testing.expect_value(t, robot.hd, Heading.South)
}

@(test)
/// description = Rotating clockwise -> changes north to east
test_rotating_clockwise__changes_north_to_east :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.North)
	follow_commands(&robot, "R")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.East)
}

@(test)
/// description = Rotating clockwise -> changes east to south
test_rotating_clockwise__changes_east_to_south :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.East)
	follow_commands(&robot, "R")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.South)
}

@(test)
/// description = Rotating clockwise -> changes south to west
test_rotating_clockwise__changes_south_to_west :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.South)
	follow_commands(&robot, "R")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.West)
}

@(test)
/// description = Rotating clockwise -> changes west to north
test_rotating_clockwise__changes_west_to_north :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.West)
	follow_commands(&robot, "R")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.North)
}

@(test)
/// description = Rotating counter-clockwise -> changes north to west
test_rotating_counter_clockwise__changes_north_to_west :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.North)
	follow_commands(&robot, "L")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.West)
}

@(test)
/// description = Rotating counter-clockwise -> changes west to south
test_rotating_counter_clockwise__changes_west_to_south :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.West)
	follow_commands(&robot, "L")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.South)
}

@(test)
/// description = Rotating counter-clockwise -> changes south to east
test_rotating_counter_clockwise__changes_south_to_east :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.South)
	follow_commands(&robot, "L")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.East)
}

@(test)
/// description = Rotating counter-clockwise -> changes east to north
test_rotating_counter_clockwise__changes_east_to_north :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.East)
	follow_commands(&robot, "L")

	testing.expect_value(t, robot.pos, Position{0, 0})
	testing.expect_value(t, robot.hd, Heading.North)
}

@(test)
/// description = Moving forward one -> facing north increments Y
test_moving_forward_one__facing_north_increments_y :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.North)
	follow_commands(&robot, "A")

	testing.expect_value(t, robot.pos, Position{0, 1})
	testing.expect_value(t, robot.hd, Heading.North)
}

@(test)
/// description = Moving forward one -> facing south decrements Y
test_moving_forward_one__facing_south_decrements_y :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.South)
	follow_commands(&robot, "A")

	testing.expect_value(t, robot.pos, Position{0, -1})
	testing.expect_value(t, robot.hd, Heading.South)
}

@(test)
/// description = Moving forward one -> facing east increments X
test_moving_forward_one__facing_east_increments_x :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.East)
	follow_commands(&robot, "A")

	testing.expect_value(t, robot.pos, Position{1, 0})
	testing.expect_value(t, robot.hd, Heading.East)
}

@(test)
/// description = Moving forward one -> facing west decrements X
test_moving_forward_one__facing_west_decrements_x :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.West)
	follow_commands(&robot, "A")

	testing.expect_value(t, robot.pos, Position{-1, 0})
	testing.expect_value(t, robot.hd, Heading.West)
}

@(test)
/// description = Follow series of instructions -> moving east and north from README
test_follow_series_of_instructions__moving_east_and_north_from_readme :: proc(t: ^testing.T) {

	robot := create_robot(7, 3, Heading.North)
	follow_commands(&robot, "RAALAL")

	testing.expect_value(t, robot.pos, Position{9, 4})
	testing.expect_value(t, robot.hd, Heading.West)
}

@(test)
/// description = Follow series of instructions -> moving west and north
test_follow_series_of_instructions__moving_west_and_north :: proc(t: ^testing.T) {

	robot := create_robot(0, 0, Heading.North)
	follow_commands(&robot, "LAAARALA")

	testing.expect_value(t, robot.pos, Position{-4, 1})
	testing.expect_value(t, robot.hd, Heading.West)
}

@(test)
/// description = Follow series of instructions -> moving west and south
test_follow_series_of_instructions__moving_west_and_south :: proc(t: ^testing.T) {

	robot := create_robot(2, -7, Heading.East)
	follow_commands(&robot, "RRAAAAALA")

	testing.expect_value(t, robot.pos, Position{-3, -8})
	testing.expect_value(t, robot.hd, Heading.South)
}

@(test)
/// description = Follow series of instructions -> moving east and north
test_follow_series_of_instructions__moving_east_and_north :: proc(t: ^testing.T) {

	robot := create_robot(8, 4, Heading.South)
	follow_commands(&robot, "LAAARRRALLLL")

	testing.expect_value(t, robot.pos, Position{11, 5})
	testing.expect_value(t, robot.hd, Heading.North)
}
