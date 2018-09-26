function* encodeBlocks(plainText) {
  if (plainText.length === 0) {
    return;
  }

  let currentCharacter;
  let currentCharacterCount = 0;

  for (let i = 0; i < plainText.length; i += 1) {
    if (i === 0) {
      currentCharacter = plainText[i];
      currentCharacterCount = 1;
    } else if (currentCharacter === plainText[i]) {
      currentCharacterCount += 1;
    } else {
      yield [currentCharacter, currentCharacterCount];
      currentCharacter = plainText[i];
      currentCharacterCount = 1;
    }
  }

  yield [currentCharacter, currentCharacterCount];
}

function encodeBlock(characterWithCount) {
  return characterWithCount[1] === 1 ? characterWithCount[0] : `${characterWithCount[1]}${characterWithCount[0]}`;
}

export function encode(plainText) {
  return [...encodeBlocks(plainText)].map(encodeBlock).join('');
}

function* decodeBlocks(encodedText) {
  if (encodedText.length === 0) {
    return;
  }

  let currentCharacter;
  let currentCharacterCount = 0;

  for (let i = 0; i < encodedText.length; i += 1) {
    currentCharacter = encodedText[i];
    const digit = parseInt(currentCharacter, 10);

    if (isNaN(digit)) {
      yield [currentCharacter, currentCharacterCount === 0 ? 1 : currentCharacterCount];
      currentCharacterCount = 0;
    } else {
      currentCharacterCount = (currentCharacterCount * 10) + digit;
    }
  }

  yield [currentCharacter, currentCharacterCount];
}

function decodeBlock(characterWithCount) {
  return characterWithCount[0].repeat(characterWithCount[1]);
}

export function decode(encodedText) {
  return [...decodeBlocks(encodedText)].map(decodeBlock).join('');
}
