# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yuni/AFT_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yuni/AFT_test/build

# Include any dependencies generated for this target.
include CMakeFiles/AFT_reader.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/AFT_reader.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/AFT_reader.dir/flags.make

CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o: CMakeFiles/AFT_reader.dir/flags.make
CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o: ../src/AFT200D80_reader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yuni/AFT_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o -c /home/yuni/AFT_test/src/AFT200D80_reader.cpp

CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yuni/AFT_test/src/AFT200D80_reader.cpp > CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.i

CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yuni/AFT_test/src/AFT200D80_reader.cpp -o CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.s

# Object files for target AFT_reader
AFT_reader_OBJECTS = \
"CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o"

# External object files for target AFT_reader
AFT_reader_EXTERNAL_OBJECTS =

AFT_reader: CMakeFiles/AFT_reader.dir/src/AFT200D80_reader.o
AFT_reader: CMakeFiles/AFT_reader.dir/build.make
AFT_reader: CMakeFiles/AFT_reader.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yuni/AFT_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable AFT_reader"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AFT_reader.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/AFT_reader.dir/build: AFT_reader

.PHONY : CMakeFiles/AFT_reader.dir/build

CMakeFiles/AFT_reader.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/AFT_reader.dir/cmake_clean.cmake
.PHONY : CMakeFiles/AFT_reader.dir/clean

CMakeFiles/AFT_reader.dir/depend:
	cd /home/yuni/AFT_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yuni/AFT_test /home/yuni/AFT_test /home/yuni/AFT_test/build /home/yuni/AFT_test/build /home/yuni/AFT_test/build/CMakeFiles/AFT_reader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/AFT_reader.dir/depend

