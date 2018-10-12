export default class Transpose {
  public static transpose(lines: string[]): string[] {
    const transposed: string[] = []

    for (let i = 0; i < lines.length; i += 1) {
      for (let j = 0; j < lines[i].length; j += 1) {
        if (!(j in transposed)) {
          transposed[j] = ''.padEnd(i, ' ')
        }

        transposed[j] += lines[i][j]
      }
    }

    return transposed
  }
}