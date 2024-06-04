# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Ijson/include

# Libraries
LIBS = -lpigpiod_if2 -lmosquitto

# Output executable
TARGET = autolock

# Source files
SRC = autolock.cpp control_servo.cpp min_mqtt.cpp

# Object files
OBJ = $(SRC:.cpp=.o)
TARDIR= ..

# Default target
all: $(TARGET)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link object files to create the executable
$(TARGET): $(OBJ)
	$(CXX) -o $(TARDIR)/$(TARGET) $(OBJ) $(LIBS)

# Clean up build artifacts
clean:
	rm -f $(TARGET) $(OBJ)

# Phony targets
.PHONY: all clean

