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

COMPILER = nasm
LINKER = ld
COMPILER_FLAG = -f elf -i include/
LINKER_FLAG = -m elf_i386 -o
LINK_LIB = $(wildcard lib/*.o)
TARGET = insertion-sort

all: $(TARGET)
	

.SECONDEXPANSION:
$(TARGET): $$(patsubst src/%.asm,build/%.o,$$(wildcard src/$$@/*.asm))
	@if [ ! -d bin ]; then mkdir bin; fi;
	@$(LINKER) $(LINKER_FLAG) bin/$@ $^ $(LINK_LIB)
	@echo "Link target: $@."

%.o:
	@if [ ! -d $(@D) ]; then mkdir -p $(@D); fi;
	@$(COMPILER) $(COMPILER_FLAG) -o $@ $(patsubst build/%.o,src/%.asm,$@)
	@echo "Compile $(patsubst %.o,%.asm,$(@F)) in $(patsubst build/%,src/%,$(@D))."


.PHONY: clean
clean:
	@rm -rf build bin
	@echo "Delete auto-generated files."
