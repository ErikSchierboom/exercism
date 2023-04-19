from datetime import timedelta

def add(moment):
    return moment + timedelta(seconds = 1_000_000_000)
