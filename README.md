## Basic info

Repo name: NASM-experiments

Summary: Programs written in assembly language.

Website: <https://github.com/tbocs/NASM-experiments>

Author: Sam Zhai (sam at tbocs dot org)

# Detailed description

This package contains assembly language source files implementing,
for example, generic algorithms. These code are written
as a by-product of my learning and practicing this language.

This package also comes with a "smart" Makefile. You can have
multiple projects, each with a group of source files, in separated
folders in src/; the Makefile will figure out the right files to
use for making a specific target.

To compile a specific program, use ```make <program-name>```, where
*<program-name>* refers to a project name, i.e.,  one of the
sub-folders names in src/. You can also run ```make``` to compile
all the projects.

## Lisence

This repository is for free software: you can redistribute the
including programs and source files created by the author and/or
modify them under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of
the License, or (at your option) any later version.

This repository is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. Some files
created by third-parties are also included and are used as external
code libraries and/or auxiliary resources; other licenses may apply.

For more details, please see the GNU General Public License. You
should have received a copy of the GNU General Public License along
with Foobar. If not, please check out <http://www.gnu.org/licenses/>.
