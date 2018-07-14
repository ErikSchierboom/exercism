export default class Words {
    count(word) {
        var counts = {};

        const matches = word.toLowerCase().match(/[^\s]+/g)

        for (const match of matches) {
            if (counts.hasOwnProperty(match))
                counts[match]++;
            else
                counts[match] = 1;
        }

        return counts;
    }
}