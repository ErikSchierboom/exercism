# Hints

For all of these tasks, you'll need the `print` command:
```awk
{print "something", "something else"}
```

## 1. List the usernames

* Use [the `FS` variable][var-fs] to define the field separator.

## 2. Print the line numbers

* Use the [built-in variable `NR`][var-vr] to get the line number.

## 3. Print records with invalid home directories.

* The home directory is the 6th field.
* Use the given `startsWith` function.
* Use [Boolean operators][boolean-ops]: `&&`, `||`, `!`.

## 4. Print the number of valid users who use bash

* The login shell is the last field; you can use [the `NF` variable][var-nf].

[boolean-ops]: https://www.gnu.org/software/gawk/manual/html_node/Boolean-Ops.html
[var-fs]: https://www.gnu.org/software/gawk/manual/html_node/User_002dmodified.html#index-FS-variable-8
[var-nf]: https://www.gnu.org/software/gawk/manual/html_node/Auto_002dset.html#index-NF-variable-2
[var-nr]: https://www.gnu.org/software/gawk/manual/html_node/Auto_002dset.html#index-NR-variable-1