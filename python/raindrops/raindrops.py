DROPS = [(3, 'Pling'), (5, 'Plang'), (7, 'Plong')]


def convert(number):
    drops = [sound for factor, sound in DROPS if number % factor == 0]
    return str(number) if len(drops) == 0 else ''.join(drops)
