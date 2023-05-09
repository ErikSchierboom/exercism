public type Item record {
    int weight;
    int value;
};

public function maximumValue(Item[] items, int maximumWeight) returns int {
    if items.length() == 0 {
        return 0;
    }

    var head = items[0];
    if head.weight > maximumWeight {
        return maximumValue(items.slice(1), maximumWeight);
    }

    return int:max(
        maximumValue(items.slice(1), maximumWeight),
        head.value + maximumValue(items.slice(1), maximumWeight - head.weight)
    );
}
