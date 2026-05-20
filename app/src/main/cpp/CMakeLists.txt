cmake_minimum_required(VERSION 3.22.1)
project("GameLauncher")

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Configure include directories
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon/core
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon/original
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon/reconstructed
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon/hooks
    ${CMAKE_CURRENT_SOURCE_DIR}/xenon/sexy
)

# List C++ source files
set(SOURCE_FILES
    xenon/core/xenon.cpp
    xenon/core/hook.cpp
    xenon/original/original_jni.cpp
    xenon/original/original_symbols.cpp
    xenon/reconstructed/reconstructed_symbols.cpp
    xenon/hooks/hook_registry.cpp
)

# Xenon hook library — must NOT be named libGameLauncher.so because
# libGameMain.so links against the original libGameLauncher.so at load time.
add_library(Xenon SHARED ${SOURCE_FILES})

# Locate Android NDK Log library
find_library(log-lib log)

# Link necessary libraries
target_link_libraries(Xenon
    ${log-lib}
    android
)
