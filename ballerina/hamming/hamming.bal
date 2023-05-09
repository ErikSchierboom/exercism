public function distance(string strand1, string strand2) returns int|error {
    if strand1.length() != strand2.length() {
        return error("Unequal strand lengths");
    }

    int dist = 0;

    foreach int i in 0 ..< strand1.length() {
        if strand1[i] != strand2[i] {
            dist += 1;
        }
    }

    return dist;
}
