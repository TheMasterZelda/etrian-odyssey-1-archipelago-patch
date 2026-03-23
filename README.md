# Etrian Odyssey 1 Archipelago Patch

This is the project to build the base patch for the `arm9.bin` from etrian odyssey for archipelago.

This project uses [armips](https://github.com/Kingcom/armips) to compile the assembly into the target `arm9.bin`.

The version bundled with the repository is a manual build for Windows. If you need to run this on a Unix environment, follow the link above and make a build manually.


# How to build

To build, you need to manually obtain the `arm9.bin` file extracted from an USA/NA version of Etrian Odyssey for the Nintendo DS.

- Put this file into the root directory of the project as `input.bin`.
- Open a command prompt at the root directory.
- Execute `.\build.bat`, or run the command `.\tools\armips.exe .\src\code.asm` manually.
- Resulting `arm9.bin` will be written if no error occurs.

The resulting file is intended to be used to generate a `.bsdiff` file, and updated within the [patcher](https://github.com/TheMasterZelda/etrian-odyssey-1-archipelago-patcher)