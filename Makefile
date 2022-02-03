CXX_COMPILER = g++
CXX_FLAGS := -std=c++14 -pthread -Werror -Wno-unused-variable -Wno-sign-compare

BUILD_DIR = builds
LAST_MODIFIED_CPP_FILE = $(shell ls -rt *\.cpp | tail -1)
TARGET = $(basename $(LAST_MODIFIED_CPP_FILE))

$(TARGET): $(BUILD_DIR)/$(TARGET)
	./$(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(LAST_MODIFIED_CPP_FILE) | $(BUILD_DIR)
	$(CXX_COMPILER) $(CXX_FLAGS) -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)