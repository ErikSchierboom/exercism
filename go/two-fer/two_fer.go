// Package twofer allows on to generate a sharing message.
package twofer

import "fmt"

// ShareWith takes a name and returns a sharing greeting.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
