# Project version
NAME    = prog
VERSION = 0.0.1

# Paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# CUDA arch
CUDA_GPU_ARCH ?= sm_52

# Compiler
CXX ?= clang++
CU  ?= clang++

# Compile flags
CXXFLAGS += -O3 -march=corei7
CXXFLAGS += -DVERSION=\"$(VERSION)\"
CXXFLAGS += -Wall -Wextra -Werror -Wnull-dereference \
            -Wdouble-promotion -Wshadow

# Language
CXXFLAGS += -std=c++17

# Includes
INCLUDES += -I$(CUDA_HOME)/include -I/opt/thrust
CXXFLAGS += $(INCLUDES)

# CUDA flags
CUFLAGS += --cuda-gpu-arch=$(CUDA_GPU_ARCH)

# Linker
LDFLAGS += -fPIC -O3
LDFLAGS += -L$(CUDA_HOME)/lib64
LDFLAGS += -lm -lcudart
