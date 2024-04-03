#!/usr/bin/env tclsh
package require tcltest
namespace import ::tcltest::*
source testHelpers.tcl

############################################################
source "hello-world.tcl"

test hello-1 "Say Hi!" -body {
    hello
} -result "Hello, World!"

cleanupTests
