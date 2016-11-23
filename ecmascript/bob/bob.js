export default class Bob {
  hey(message) {
      if (this.isSilence(message))
          return "Fine. Be that way!";
      if (this.isYelling(message))
          return "Whoa, chill out!";
      if (this.isQuestion(message))
          return "Sure.";
      return "Whatever.";
  }

  isSilence(message) {
    return message.trim() === '';
  }

  isYelling(message) {
    return message.toUpperCase() === message && message.search("[a-zA-Z]+") !== -1;
  }

  isQuestion(message) {
    return message.trim().endsWith('?');
  }
}