DROPS = (3, 'Pling'), (5, 'Plang'), (7, 'Plong')


def convert(number):
    return ''.join(sound for factor, sound in DROPS if number % factor == 0) or str(number)
