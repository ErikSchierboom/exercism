import ballerina/test;

@test:Config
function noItems() {
    Item[] items = [];
    test:assertEquals(maximumValue(items, 100), 0);
}

@test:Config {
    enable: false
}
function oneItemTooHeavy() {
    Item[] items = [{weight: 100, value: 1}];
    test:assertEquals(maximumValue(items, 10), 0);
}

@test:Config {
    enable: false
}
function fiveItemsCannotBeGreedyByWeight() {
    Item[] items = [
        {weight: 2, value: 5},
        {weight: 2, value: 5},
        {weight: 2, value: 5},
        {weight: 2, value: 5},
        {weight: 10, value: 21}
    ];
    test:assertEquals(maximumValue(items, 10), 21);
}

@test:Config {
    enable: false
}
function fiveItemsCannotBeGreedyByValue() {
    Item[] items = [
        {weight: 2, value: 20},
        {weight: 2, value: 20},
        {weight: 2, value: 20},
        {weight: 2, value: 20},
        {weight: 10, value: 50}
    ];
    test:assertEquals(maximumValue(items, 10), 80);
}

@test:Config {
    enable: false
}
function exampleKnapsack() {
    Item[] items = [
        {weight: 5, value: 10},
        {weight: 4, value: 40},
        {weight: 6, value: 30},
        {weight: 4, value: 50}
    ];
    test:assertEquals(maximumValue(items, 10), 90);
}

@test:Config {
    enable: false
}
function eightItems() {
    Item[] items = [
        {weight: 25, value: 350},
        {weight: 35, value: 400},
        {weight: 45, value: 450},
        {weight: 5, value: 20},
        {weight: 25, value: 70},
        {weight: 3, value: 8},
        {weight: 2, value: 5},
        {weight: 2, value: 5}
    ];
    test:assertEquals(maximumValue(items, 104), 900);
}

@test:Config {
    enable: false
}
function fifteenItems() {
    Item[] items = [
        {weight: 70, value: 135},
        {weight: 73, value: 139},
        {weight: 77, value: 149},
        {weight: 80, value: 150},
        {weight: 82, value: 156},
        {weight: 87, value: 163},
        {weight: 90, value: 173},
        {weight: 94, value: 184},
        {weight: 98, value: 192},
        {weight: 106, value: 201},
        {weight: 110, value: 210},
        {weight: 113, value: 214},
        {weight: 115, value: 221},
        {weight: 118, value: 229},
        {weight: 120, value: 240}
    ];
    test:assertEquals(maximumValue(items, 750), 1458);
}
