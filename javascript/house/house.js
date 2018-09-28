const subjects =
  [
    'house that Jack built',
    'malt',
    'rat',
    'cat',
    'dog',
    'cow with the crumpled horn',
    'maiden all forlorn',
    'man all tattered and torn',
    'priest all shaven and shorn',
    'rooster that crowed in the morn',
    'farmer sowing his corn',
    'horse and the hound and the horn',
  ];

const verbs =
  [
    'lay in',
    'ate',
    'killed',
    'worried',
    'tossed',
    'milked',
    'kissed',
    'married',
    'woke',
    'kept',
    'belonged to',
    '',
  ];

export default class House {
  static verses(startVerse, endVerse) {
    const lines = [];

    for (let verse = startVerse; verse <= endVerse; verse += 1) {
      lines.push(...this.verse(verse));

      if (verse < endVerse) {
        lines.push('');
      }
    }

    return lines;
  }

  static verse(number) {
    const lines = [];

    for (let i = number; i >= 1; i -= 1) {
      lines.push(this.line(number, i));
    }

    return lines;
  }

  static line(number, index) {
    const subject = subjects[index - 1];
    const verb = verbs[index - 1];
    const ending = index === 1 ? '.' : '';

    return index === number
      ? `This is the ${subject}${ending}`
      : `that ${verb} the ${subject}${ending}`;
  }
}
