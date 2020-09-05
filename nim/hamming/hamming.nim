import sequtils

proc distance*(strand1: string, strand2: string): int =
    if strand1.len != strand2.len:
        raise newException(ValueError, "Strands have different lengths")

    (strand1.low..strand1.high).countIt(strand1[it] != strand2[it])