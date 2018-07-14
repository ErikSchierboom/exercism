function daysInMonth(year, month) {
    return new Date(year, month + 1, 0).getDate();
}

function daysOfMonthByDayOfWeek(year, month) {
    const days = new Map();

    for (let day = 1; day <= daysInMonth(year, month); day++) {
        const date = new Date(year, month, day);
        const dayOfWeek = date.getDay();

        const dates = days.has(dayOfWeek) ? days.get(dayOfWeek) : [];
        dates.push(date);

        days.set(dayOfWeek, dates);
    }

    return days;
}

function dayToDayOfWeek(day) {
    const days = [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
    ];
    
    return days.indexOf(day);
}

function teenthToIndex(teenth) {
    return parseInt(teenth[0]) - 1;
}

export default function meetupDay(year, month, day, teenth) {
    const days = daysOfMonthByDayOfWeek(year, month);
    const relevantDays = days.get(dayToDayOfWeek(day));

    if (teenth === 'last')
        return relevantDays[relevantDays.length - 1];

    if (teenth === 'teenth') {
        return relevantDays.find(date => date.getDate() >= 13);
    }

    const teenthIndex = teenthToIndex(teenth);

    if (teenthIndex >= relevantDays.length)
        throw new Error('Invalid teenth index');

    return relevantDays[teenthIndex];
}