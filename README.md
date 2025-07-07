# Compilation of Denys Dutykh's CV

This repository contains the LaTeX source code for Denys Dutykh's Curriculum Vitae.

## Author

* **Dr. Denys Dutykh** (Khalifa University of Science and Technology, Abu Dhabi, UAE)

## Versions

There are three versions of the CV available:

*   **Classic:** A detailed version of the CV.
*   **Short:** A condensed version of the CV.
*   **Modern:** A modern-style full CV.

## Compilation

To compile the CVs, you need to have a LaTeX distribution installed (e.g., TeX Live, MiKTeX).

You can use the provided `Makefile` to simplify the compilation process. After a successful compilation, the temporary files (`.aux`, `.log`, etc.) are automatically removed.

The following commands are available:

*   `make all`: Compiles all available CV versions (default).
*   `make classic`: Compiles only the Classic version.
*   `make short`: Compiles only the Short version.
*   `make modern`: Compiles only the Modern version.
*   `make clean`: Manually removes all temporary files.
*   `make help`: Displays a help message with all available commands.

Each CV is compiled with `pdflatex` twice to ensure all cross-references are correctly resolved. The final output files are:

*   `Classic/build/ClassicFullCV-Dutykh.pdf`
*   `Short/build/ShortCV-Dutykh.pdf`
*   `Modern/build/ModernFullCV-Dutykh.pdf`
