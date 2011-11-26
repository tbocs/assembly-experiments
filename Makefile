# Makefile
# Smart auto-complilation script of sub-projects.
# 
# Part of assembly-experiments (https://github.com/tbocs/assembly-experiments)
# Author: Sam Zhai (sam at tbocs dot org)
#
# This file is free software: you can redistribute the including programs and
# source files created by the author and/or modify them under the terms of the
# GNU General Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# This package is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. Some files created by third-parties are included as
# external code libraries auxiliary resources; other licenses may apply.
#
# For more details, please see the GNU General Public License. You should have
# received a copy of the GNU General Public License at the root of the package.
# If not, please check out <http://www.gnu.org/licenses/>.

# Compilers
CC = gcc
CXX = g++
AS = nasm
LD = g++ 

# Compile / link libraries to include
CLIBS =
CXXLIBS = 
ASLIBS = include
LDLIBS = $(wildcard lib/*.o)

# Additional flags and other variables
CFLAGS =
CXXFLAGS =
ASFLAGS = -f elf
LDFLAGS = -m elf_i386

# Targets / sub-projects (auto-detected)
TARGET = $(shell ls src)

.SILENT:
.SECONDEXPANSION:

all: $(TARGET)
	echo "All targets are built successfully."

include $(wildcard src/*/Makefile)

$(TARGET): TARGET = $@
$(TARGET): $$(patsubst src/%,%, \
           $$(shell find src/$$(TARGET) -regex '.*\.\(asm\|c\|cpp\)'))
	echo "Link target: $(TARGET)."
	# if [ ! -d bin ]; then mkdir bin; fi;
	# $(LD) $(LDFLAGS) -O bin/$@ $(addprefix build/,$^) $(LDLIBS)

%.asm:
	echo "Compile assembly file '$(@F)' in sub-project '$(@D)'."
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	#$(AS) $(ASFLAGS) -I $(ASLIBS) -o build/$@ $(patsubst %.o,src/%.asm,$@)

%.c:
	echo "Compile C file '$(@F)' in sub-project '$(@D)'."
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	#$(CC) $(CFLAGS) -I $(CLIBS) -o build/$@ $(patsubst %.o,src/%.asm,$@)

%.cpp: CFLAGS = "hello world"
%.cpp: CFLAGS += "huh?"
%.cpp:
	echo "Compile C++ file '$(@F)' in sub-project '$(@D)'."
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	#$(CXX) $(CXXFLAGS) -I $(CXXLIBS) -o build/$@ $(patsubst %.o,src/%.asm,$@)

.PHONY: clean
clean:
	rm -rf build bin
	echo "Auto-generated files are deleted."
