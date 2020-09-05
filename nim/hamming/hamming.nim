import sequtils

proc distance*(strand1: string, strand2: string): int =
    if strand1.len != strand2.len:
        raise newException(ValueError, "Strands have different lengths")
    else:
        zip(strand1, strand2).countIt(it[0] != it[1])