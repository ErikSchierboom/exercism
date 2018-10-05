function maxStringLength(strings) {
  return Math.max(...strings.map(x => x.length));
}

export default function transpose(rows) {
  if (rows.length === 0) {
    return [];
  }

  const maxLineLength = maxStringLength(rows);
  const transposed = new Array(maxLineLength).fill('');

  for (let i = 0; i < rows.length; i += 1) {
    for (let j = 0; j < rows[i].length; j += 1) {
      transposed[j] += rows[i][j];
    }

    const remainderRowsMaximumLength = maxStringLength(rows.slice(i + 1));
    for (let k = rows[i].length; k < remainderRowsMaximumLength; k += 1) {
      transposed[k] += ' ';
    }
  }

  return transposed;
}
