export default function Proverb(...subjects: string[]): string {
    const line = (index: number) =>
        index === subjects.length
            ? `And all for the want of a ${subjects[0]}.`
            : `For want of a ${subjects[index - 1]} the ${subjects[index]} was lost.`
    const lines = Array.from({ length: subjects.length }, (_, i) => i + 1)

    return lines.map(line).join('\n')
}