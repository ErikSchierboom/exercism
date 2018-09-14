const blockSize = 5;
const minLetterValue = 'a'.charCodeAt();
const maxLetterValue = 'z'.charCodeAt();

function getEncodedCharacters(words) {
    return [...getValidCharacters(words)].map(encode);
}

function getValidCharacters(words) {
    return words.toLowerCase().replace(/[^\w]/g, "");
}

function encode(c) {
    if (/\d/.test(c))
        return c;

    return String.fromCharCode(minLetterValue + (maxLetterValue - c.charCodeAt()));
}

function encodeInBlocks(value) {
    const blocks = [];

    for (let i = 0; i < value.length; i += blockSize)
        blocks.push(value.slice(i, i + blockSize).join(""));
    
    return blocks;
}

const atbash = {
    encode: function(input) {
        return encodeInBlocks(getEncodedCharacters(input)).join(' ');
    }
}

export default atbash;