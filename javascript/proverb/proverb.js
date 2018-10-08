export default function Proverb(...args) {
  const lastArgument = args[args.length - 1];
  const qualifier = lastArgument.qualifier ? `${lastArgument.qualifier} nail` : args[0];
  const subjects = lastArgument.qualifier ? args.slice(0, -1) : args;

  function line(index) {
    return index === subjects.length
      ? `And all for the want of a ${qualifier}.`
      : `For want of a ${subjects[index - 1]} the ${subjects[index]} was lost.`;
  }
  const lines = Array.from({ length: subjects.length }, (_, i) => i + 1);

  return lines.map(line).join('\n');
}
