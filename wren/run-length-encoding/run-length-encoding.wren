class RLE {
  static encode(s) {
    var current = null
    var count = 0
    var encoded = ""

    for (c in s) {
      if (c == current) {
        count = count + 1
      } else {
        if (count > 0) {
          encoded = encoded + (count > 1 ? count.toString : "") + current
        }

        count = 1
        current = c      
      }
    }

    if (count > 1) {
      encoded = encoded + count.toString + current
    } else if (count == 1) {
      encoded = encoded + current
    }

    return encoded
  }

  static decode(s) {
    var current = null
    var count = 0
    var decoded = ""

    for (c in s) {
      var num = c != " " ? Num.fromString(c) : null

      if (num) {
        count = count * 10 + num
      } else {
        decoded = decoded + c * (count == 0 ? 1 : count)
        count = 0
      }
    }
    
    return decoded
  }
}