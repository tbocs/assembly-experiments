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
LD = ld

# Compile / link libraries to include
CLIBS =
CXXLIBS =
ASLIBS = -i include/
LDLIBS = $(wildcard lib/*.o)

# Additional flags and other variables
CFLAGS = -c
CXXFLAGS = -c
ASFLAGS = 
LDFLAGS = 

# Targets / sub-projects (auto-detected)
TARGET = $(shell ls src)
PRE_COMMAND =
POST_COMMAND =

.SILENT:
.SECONDEXPANSION:

all: $(TARGET)
	echo "All targets are built successfully."

include $(wildcard src/*/Makefile)

$(TARGET): $$(patsubst src/%,%, $$(shell find src/$$@ -regex '.*\.\(asm\|c\|cpp\)'))
	echo "Link target: $@."
	if [ ! -d bin ]; then mkdir bin; fi;
	$(PRE_COMMAND)
	if ( $(if $(filter-out .asm,$(suffix $^)),true,false) ); then \
		$(CXX) $(LDFLAGS) -o bin/$@ \
		$(addsuffix .o,$(addprefix build/,$(basename $^))) $(LDLIBS) ; \
	else \
		$(LD) $(LDFLAGS) -o bin/$@ \
		$(addsuffix .o,$(addprefix build/,$(basename $^))) $(LDLIBS) ; \
	fi;
	$(POST_COMMAND)

%.asm:
	echo "Compile assembly file '$(@F)'"
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	$(PRE_COMMAND)
	$(AS) $(ASFLAGS) $(ASLIBS) -o build/$(patsubst %.asm,%.o,$@) src/$@
	$(POST_COMMAND)

%.c:
	echo "Compile C file '$(@F)'"
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	$(PRE_COMMAND)
	$(CC) $(CFLAGS) $(CLIBS) -o build/$(patsubst %.c,%.o,$@) src/$@
	$(POST_COMMAND)

%.cpp:
	echo "Compile C++ file '$(@F)'"
	if [ ! -d build/$(@D) ]; then mkdir -p build/$(@D); fi;
	$(PRE_COMMAND)
	$(CXX) $(CXXFLAGS) $(CXXLIBS) -o build/$(patsubst %.cpp,%.o,$@) src/$@
	$(POST_COMMAND)
.PHONY: clean
clean:
	rm -rf build bin
	echo "Auto-generated files are deleted."
