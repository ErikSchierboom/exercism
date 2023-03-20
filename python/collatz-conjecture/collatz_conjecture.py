def steps(number):
    if number < 1:
        raise ValueError("Only positive integers are allowed")

    num_steps = 0

    while number != 1:
        number = number // 2 if number % 2 == 0 else number * 3 + 1
        num_steps += 1

    return num_steps
