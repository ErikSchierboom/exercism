"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var vowelRegex = RegExp(/(^|\s+)(a|e|i|o|u|yt|xr)(\w+)/g);
var consonantRegex = RegExp(/(^|\s+)(ch|qu|thr|th|sch|yt|\wqu|\w)(\w+)/g);

var vowelReplacement = "$1$2$3ay";
var consonantReplacement = "$1$3$2ay";

var PigLatin = (function () {
    function PigLatin() {
        _classCallCheck(this, PigLatin);
    }

    _createClass(PigLatin, [{
        key: "translate",
        value: function translate(sentence) {
            if (vowelRegex.test(sentence)) return sentence.replace(vowelRegex, vowelReplacement);else return sentence.replace(consonantRegex, consonantReplacement);
        }
    }]);

    return PigLatin;
})();

exports["default"] = PigLatin;
module.exports = exports["default"];