const romanNumeralValues = new Map();
romanNumeralValues.set(1000, 'M');
romanNumeralValues.set(900,  'CM');
romanNumeralValues.set(500,  'D' );
romanNumeralValues.set(400,  'CD');
romanNumeralValues.set(100,  'C' );
romanNumeralValues.set(90,   'XC');
romanNumeralValues.set(50,   'L' );
romanNumeralValues.set(40,   'XL');
romanNumeralValues.set(10,   'X' );
romanNumeralValues.set(9,    'IX');
romanNumeralValues.set(5,    'V' );
romanNumeralValues.set(4,    'IV');
romanNumeralValues.set(1,    'I' );

export default function toRoman(number) {
    for (const [threshold, numeral] of romanNumeralValues.entries()) {
        if (number >= threshold) {
            return numeral + toRoman(number - threshold);
        }
    }

    return '';
}