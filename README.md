Cork
==============================================
Version:      0.1
Created By:   Michael D. Lowis
Email:        mike@mdlowis.com

About This Project
----------------------------------------------
This project aims to provide an easy to use memory leak detector for c++. This
is provided in the form of a library that users can then link against. The
library provides overridden implementations of the *new* and *delete* operators
that track where memory is being allocated and freed. Users then can call a
function that prints out a detailed report of the currently allocated memory.

License
----------------------------------------------
Unless explicitly stated otherwise, all code, documentation, and files contained
within this repository are released under the BSD 2-clause license.
See LICENSE.md for more details

Project Files and Directories
----------------------------------------------
    build/         Output directory for build artifacts
    docs/          Documentation and doxygen output
    source/        Source code
    tests/         Unit tests
    tools/         Tools required to build the library
    Doxyfile       Doxygen configuration file
    LICENSE.md     File containing the license
    rakefile.rb    Rakefile containing build tasks
    README.md

