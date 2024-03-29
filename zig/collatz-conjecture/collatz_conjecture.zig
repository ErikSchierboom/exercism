pub const ComputationError = error{IllegalArgument};

pub fn steps(number: isize) anyerror!usize {
    if (number < 1) return ComputationError.IllegalArgument;

    var current = number;
    var num_steps: usize = 0;

    while (current != 1) : (num_steps += 1)
        current = if (current % 2 == 0) current / 2 else current * 3 + 1;

    return num_steps;
}
