function keep(input, predicate) {
    const matches = [];

    for (const value of input) {
        if (predicate(value))
            matches.push(value);
    }

    return matches;
}

function discard(input, predicate) {
    return keep(input, value => !predicate(value));
}

export default { keep, discard }