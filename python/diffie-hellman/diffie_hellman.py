from secrets import randbelow

def private_key(p):
    return 2 + randbelow(p - 2)


def public_key(p, g, private):
    return g ** private % p


def secret(p, public, private):
    return public ** private % p
