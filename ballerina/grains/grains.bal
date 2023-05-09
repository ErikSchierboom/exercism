public function square(int n) returns float|error {
    if (n <= 0 || n > 64) {
        return error("Invalid square");
    }

    return 2.0.pow(<float>n - 1.0);
}

public function total() returns float {
    return 2.0.pow(64.0) - 1;
}
