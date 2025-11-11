# Project Overview

This project is a simple bootloader and a minimal 32-bit kernel for the x86 architecture. The bootloader is written in 16-bit assembly and is responsible for loading the kernel from the disk, switching the CPU to 32-bit protected mode, and then transferring control to the kernel. The kernel is written in C and demonstrates a basic operation by writing a character to the video memory.

## Building and Running

The project uses a `Makefile` to automate the build process. The following commands are available:

*   **`make`** or **`make all`**: Builds the entire project, creating the `os-image.bin` file. This is the default command.
*   **`make run`**: Builds the project and then runs the `os-image.bin` file in the QEMU emulator.
*   **`make clean`**: Removes all the build artifacts (`.bin` and `.o` files).

### Key Files

*   **`mbr.asm`**: The Master Boot Record, the entry point of the bootloader.
*   **`kernel.c`**: The main C file for the kernel.
*   **`disk.asm`**: Contains the logic for reading from the disk.
*   **`gdt.asm`**: Defines the Global Descriptor Table (GDT).
*   **`switch-to-32bit.asm`**: The code to switch to 32-bit protected mode.
*   **`kernel-entry.asm`**: The assembly entry point for the C kernel.
*   **`Makefile`**: The build script for the project.

## Development Conventions

The project follows a simple structure where the bootloader and kernel are separated into different files. The assembly code is written for NASM, and the C code is compiled with GCC for a 32-bit target. The code is written to be "freestanding," meaning it does not rely on any standard library functions.
