package parsinglogfiles

import (
	"fmt"
	"regexp"
)

func IsValidLine(text string) bool {
	regex := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
	return regex.MatchString(text)
}

func SplitLogLine(text string) []string {
	regex := regexp.MustCompile(`<(~|=|-|\*)*>`)
	return regex.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	regex := regexp.MustCompile(`(?i)".*password.*"`)

	var count int
	for _, line := range lines {
		if regex.MatchString(line) {
			count++
		}
	}

	return count
}

func RemoveEndOfLineText(text string) string {
	regex := regexp.MustCompile(`end-of-line\d+`)
	return regex.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	regex := regexp.MustCompile(`User +(\w+)`)

	taggedLines := make([]string, len(lines))
	for i, line := range lines {
		matches := regex.FindStringSubmatch(line)

		if len(matches) > 0 {
			taggedLines[i] = fmt.Sprintf("[USR] %s %s", matches[1], line)
		} else {
			taggedLines[i] = line
		}
	}

	return taggedLines
}
