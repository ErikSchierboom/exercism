// Package twofer implements sharing functionality
package twofer

import "fmt"

// ShareWith takes a name and returns a sharing sentence
func ShareWith(name string) string {
	if len(name) == 0 {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
