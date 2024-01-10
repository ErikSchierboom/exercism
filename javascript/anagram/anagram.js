export function findAnagrams(input, candidates) {
  const notSameAsInput = (word) => input.toLowerCase() !== word.toLowerCase();
  const hasSameLettersAsInput = (word) =>
    sortedString(word) === sortedString(input);
  const sortedString = (word) => [...word.toLowerCase()].sort().join("");
  const isAnagram = (word) =>
    notSameAsInput(word) && hasSameLettersAsInput(word);

  return candidates.filter(isAnagram);
}
