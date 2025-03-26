NAME = final-project

CC = gcc
CFLAGS = -std=c++17 -O2
LD_FLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

BIN_DIR = bin
INC_DIR = include
SRC_DIR = src
OBJ_DIR = obj

BIN = $(addprefix bin/, $(NAME))
SRC = $(shell find src -name '*.cpp')
OBJ = $(patsubst src/%.cpp, obj/%.o, $(SRC))

all: $(BIN)

$(BIN): $(OBJ)
	@mkdir -p bin
	$(CC) $(OBJ) -o $@ $(LD_FLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I include -c $< -o $@

clean:
	rm -rf obj

fclean: clean
	rm -rf bin

re: fclean all

.PHONY: all clean fclean re