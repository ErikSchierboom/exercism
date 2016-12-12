'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});
exports['default'] = meetupDay;
function daysInMonth(year, month) {
    return new Date(year, month + 1, 0).getDate();
}

function daysOfMonthByDayOfWeek(year, month) {
    var days = new Map();

    for (var day = 1; day <= daysInMonth(year, month); day++) {
        var date = new Date(year, month, day);
        var dayOfWeek = date.getDay();

        var dates = days.has(dayOfWeek) ? days.get(dayOfWeek) : [];
        dates.push(date);

        days.set(dayOfWeek, dates);
    }

    return days;
}

function dayToDayOfWeek(day) {
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    return days.indexOf(day);
}

function teenthToIndex(teenth) {
    return parseInt(teenth[0]) - 1;
}

function meetupDay(year, month, day, teenth) {
    var days = daysOfMonthByDayOfWeek(year, month);
    var relevantDays = days.get(dayToDayOfWeek(day));

    if (teenth === 'last') return relevantDays[relevantDays.length - 1];

    if (teenth === 'teenth') {
        return relevantDays.find(function (date) {
            return date.getDate() >= 13;
        });
    }

    var teenthIndex = teenthToIndex(teenth);

    if (teenthIndex >= relevantDays.length) throw new Error('Invalid teenth index');

    return relevantDays[teenthIndex];
}

module.exports = exports['default'];