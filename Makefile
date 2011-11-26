# Makefile
# Smart auto-complilation script of sub-projects.
# 
# Part of NASM-experiments (https://github.com/tbocs/NASM-experiments)
# Author: Sam Zhai (sam at tbocs dot org)
#
# This file is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version
# 3 of the License, or (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# For more details, please see the GNU General Public License.
# You should have received a copy of the GNU General Public
# License in the root folder of the repository. If not, please
# check out <http://www.gnu.org/licenses/>.

# Compilers
CC = gcc
CXX = g++
AS = nasm
LD = ld

# Libs to including folders and library paths
CLIBS =
CXXLIBS = 
ASLIBS = include
LDLIBS =

# Additional flags and other variables
CFLAGS =
CXXFLAGS =
ASFLAGS = -f elf
LDFLAGS = -m elf_i386

# Targets (auto-detected)
TARGET = $(shell ls src)

LOL = "============this is root"

.SILENT:
.SECONDEXPANSION:

all: $(TARGET)
	echo "All targets are built successfully."

include $(wildcard src/*/Makefile)

$(TARGET): $$(wildcard src/$$@/*)
	echo "Link target: $@."
	if [ ! -d bin ]; then mkdir bin; fi;
	$(LD) $(LDFLAGS) -O bin/$@ $(addprefix build/,$^) $(LDLIBS)

%.o:
	echo $(LOL)
	echo "Compile $(patsubst %.o,%.asm,$(@F)) in $(@D)."
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	$(AS) $(ASFLAGS) -I $(ASLIBS) -o build/$@ $(patsubst %.o,src/%.asm,$@)

.PHONY: clean
clean:
	rm -rf build bin
	echo "Auto-generated files are deleted."
