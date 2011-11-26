
NASM-experiments - <https://github.com/tbocs/NASM-experiments>

Author: Sam Zhai (sam at tbocs dot org)

## At a glance

This package contains source code written in Assembly, C, and C++. They
implement a variety of stuff, such as some generic algorithms. It also has a
"smart" Makefile, which enables you to create multiple sub-projects inside the
`src` folder of this package, each with a group of source files. The "smart"
Makefile makes sure the making process is done right for each sub-project. It
also supports coustomized making in a simple and systematic way. This package
is created as a by-product of my learning and practicing the assembly language.

## Documentation

### General instructions

To initiate a sub-project, simply create a new folder in `src`, which can be
found at the root of this package. Then, put any Assembly, C and C++ source
(and header) files inside that folder as you wish. You can also create folders
inside the sub-project folder; files inside will be recognized. However, a
folder will be recognized as a sub-project folder, as well as a making target
in the package's making system, only when it's right under the `src`.

To compile a specific program, go the root of this package, and run

    $ make <program-name>

where `<program-name>` refers to a sub-project name, i.e., the name of one of
the folders right under `src`. You can also run

    $ make

to build all the sub-projects. Note that new folders such as `build` and `bin`
may appear at the root of the package as a result of the making process. All
the intermediate object files are created under the `build` and is
categorized in the same way as in the `src`. What this means is that source
files are compiled into intermediate object files during the first step of the
making process. The process can be described as

    src/sub_project/filename.[asm|c|cpp] -> build/sub_project/filename.o

Apparently, you need to make sure that each source file has an unique name. 
Currently, a sub-project can only have one output as target. Therefore, if you
want to create an executable from a sub-project, you either have one
```main()``` function in one C/C++ source file or one gloabl```_start``` lable
in one assembly source file. If you want to create two or more targets
(executables or libraries) which share some object or source files, the best
way to go is to create a sub-project for each target, and put common resource
in `include` (for compilation) or `lib` (for linking).

### Customization

To costomize the making process (e.g. add/reset compiler flag, which is a
Makefile variable, during a certain compilation process), simply create a
`Makefile` right under the sub-project folder. The format of the content
should adhere to the following rules:

    [sub-project name] : [variable name] = [variable value]

if you want to set a variable for everything in the sub-project, or

    [sub-project name]/[file name] : [variable name] = [variable value]

if you only want to set a variable for the compilation of a particular source
file. Only one variable can be defined in each line. The target part before the
colon is required for each line. "=" can be substituded by "+=", "?=" and ":="
at your choice. A variable is only effective inside the target range, and is
automatically restored to the original value once the local target is done.

If you are an advanced user of Makefile, you should know to use "$$" instead of
"$" for automatic variables and functions as a part of secondary expansion. You
can also write your own making process for a speicific project. For details on
such advanced topics, make sure to see GNU Make documentation.

### Example

See the ```src/sample_proj``` sub-project.

### Note on assembly, C and C++ compability

Source files of different languages are compiled using different compilers. By
default, ASM is compiled by nasm, C by gcc, and C++ by g++.

For linking, we choose g++ instead of gcc or ld because the other two require
additional settings to handle C++ linking. However, if you encounter a linking
problem between C++ and C, consider using ```extern "C"``` in your C++ source
file to let g++ know that something should be looked up in C object files.

## Lisence

This package is free software: you can redistribute the including programs and
source files created by the author and/or modify them under the terms of the
GNU General Public License as published by the Free Software Foundation, either
version 3 of the License, or (at your option) any later version.

This package is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. Some files created by third-parties are also included as
external code libraries auxiliary resources; other licenses may apply.

For more details, please see the GNU General Public License. You should have
received a copy of the GNU General Public License at the root of this package.
If not, please check out <http://www.gnu.org/licenses/>.
