public function score(float x, float y) returns int {
    var diff = (x * x + y * y).sqrt();
    if diff <= 1.0 {
        return 10;
    }

    if diff <= 5.0 {
        return 5;
    }

    if diff <= 10.0 {
        return 1;
    }

    return 0;
}
