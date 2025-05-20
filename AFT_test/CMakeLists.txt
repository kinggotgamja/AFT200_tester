project(AFT_test)

include_directories(include)
add_executable(AFT_sender src/CAN_sender.cpp)
add_executable(AFT_reader src/AFT200D80_reader.cpp)
