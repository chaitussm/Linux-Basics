cat(1)                                                                                                                                         General Commands Manual                                                                                                                                         cat(1)

NAME
       cat - Concatenate FILE(s), or standard input, to standard output With no FILE, or when FILE is -, read standard input.

SYNOPSIS
       cat [-A|--show-all] [-b|--number-nonblank] [-e ] [-E|--show-ends] [-n|--number] [-s|--squeeze-blank] [-t ] [-T|--show-tabs] [-v|--show-nonprinting] [-u ] [-h|--help] [-V|--version] [file]

DESCRIPTION
       Concatenate FILE(s), or standard input, to standard output With no FILE, or when FILE is -, read standard input.

OPTIONS
       -A, --show-all
              equivalent to -vET

       -b, --number-nonblank
              number nonempty output lines, overrides -n

       -e     equivalent to -vE

       -E, --show-ends
              display $ at end of each line

       -n, --number
              number all output lines

       -s, --squeeze-blank
              suppress repeated empty output lines

       -t     equivalent to -vT

       -T, --show-tabs
              display TAB characters at ^I

       -v, --show-nonprinting
              use ^ and M- notation, except for LF (\n) and TAB (\t)

       -u     (ignored)

       -h, --help
              Print help

       -V, --version
              Print version

VERSION
       v(uutils coreutils) 0.2.2

                                                                                                                                             cat (uutils coreutils) 0.2.2                                                                                                                                      cat(1)
