# Makefile for project sample_proj
# Define project-specific flags and other variables.
#
# Format: 
#   [project name]: Variable = [Value]
#   [project name]/[file name]: Variable = [Value]
#
# Notes:
#   1. One line can only contain one variable definition.
#   2. "=" can be substituded by "+=", "?=" and ":=".
#      See GNU Make documentation for more details.
#   3. The variables set are only effective inside the local
#      target context defined at the beginning of each line.
#      The original value is automatically restored when
#      the local target is done.
#   4. For any use of automatic variables and functions,
#      please use "$$" instead of "$" as secondary expansion.
#      See GNU Make documentation for more details.

# Flags and other variables for the whole projcet target.
sample_proj: CXXFLAGS += -std=c++0x
sample_proj: ASFLAGS += $$(wildcard lib/*.o)

# Flags and other variables for specific file target.
sample_proj/main.cpp: CXXFLAGS += -Werror
sample_proj/main.cpp: CXXLIBS = include 
