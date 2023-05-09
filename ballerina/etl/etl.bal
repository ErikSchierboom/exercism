public function transform(map<string[]> old) returns map<int> {
    map<int> transformed = {};
    [string, int][] rows = [];

    foreach var scoreAsStr in old.keys() {
        foreach var letter in old.get(scoreAsStr) {
            var score = int:fromString(scoreAsStr);

            if score is int {
                rows.push([letter.toLowerAscii(), score]);
            }
        }
    }

    foreach var [letter, score] in rows.sort() {
        transformed[letter] = score;
    }

    return transformed;
}
