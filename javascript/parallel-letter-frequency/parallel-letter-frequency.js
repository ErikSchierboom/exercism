export const parallelLetterFrequency = (texts) => {
  let frequencies = {};
  Promise.all(texts.map((text) => letterFrequency(frequencies, text)));
  return frequencies;
};

const letterFrequency = (frequencies, text) => {
  return new Promise((resolve) => {
    for (const [letter] of text.toLowerCase().match(/\p{Letter}/gu) || [])
      frequencies[letter] = (frequencies[letter] || 0) + 1;

    resolve(frequencies);
  });
};
