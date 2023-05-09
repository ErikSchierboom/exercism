const int earthYearSeconds = 31557600;

const map<float> orbitalPeriods = {
    Mercury: 0.2408467,
    Venus: 0.61519726,
    Earth: 1.0,
    Mars: 1.8808158,
    Jupiter: 11.862615,
    Saturn: 29.447498,
    Uranus: 84.016846,
    Neptune: 164.79132
};

function age(string planet, int seconds) returns float|error {
    if !orbitalPeriods.hasKey(planet) {
        return error("not a planet");
    }

    return (<float>seconds / orbitalPeriods.get(planet) / earthYearSeconds).round(2);
}

