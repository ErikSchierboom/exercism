'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});
exports['default'] = score;

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

var letterScores = {
    'A': 1, 'E': 1, 'I': 1, 'O': 1, 'U': 1, 'L': 1, 'N': 1, 'R': 1, 'S': 1, 'T': 1,
    'D': 2, 'G': 2,
    'B': 3, 'C': 3, 'M': 3, 'P': 3,
    'F': 4, 'H': 4, 'V': 4, 'W': 4, 'Y': 4,
    'K': 5,
    'J': 8, 'X': 8,
    'Q': 10, 'Z': 10
};

function score(input) {
    return [].concat(_toConsumableArray((input || '').toUpperCase())).map(function (letter) {
        return letterScores[letter];
    }).reduce(function (x, y) {
        return x + y;
    }, 0);
}

// let letterScores =
//     [("AEIOULNRST", 1); ("DG", 2); ("BCMP", 3); ("FHVWY", 4); ("K", 5); ("JX", 8); ("QZ", 10)]
//     |> List.map (fun (letters, score) -> letters |> Seq.map (fun letter -> (letter, score)))
//     |> Seq.concat
//     |> Map.ofSeq

// let scoreLetter letter = defaultArg (Map.tryFind letter letterScores) 0

// let score (word:string) = word.ToUpperInvariant() |> Seq.sumBy scoreLetter
module.exports = exports['default'];