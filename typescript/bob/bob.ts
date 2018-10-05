export default class Bob {
    hey(message: string): string {
        if (this.isSilence(message)) {
            return "Fine. Be that way!"
        } else if (this.isYelling(message)) {
            return "Whoa, chill out!"
        } else if (this.isQuestion(message)) {
            return "Sure."
        } else {
            return "Whatever."
        }
    }

    private isSilence(message: string): boolean {
      return message.trim() === ''
    }

    private isYelling(message: string): boolean {
      return message.toUpperCase() === message && message.search(/[a-zA-Z]+/) !== -1
    }

    private isQuestion(message: string): boolean {
      return message.trim().endsWith('?')
    }
  }