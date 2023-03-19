EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the remaining baking time"""
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time in minutes"""
    return PREPARATION_TIME * number_of_layers

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the elapsed time in minutes"""
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
