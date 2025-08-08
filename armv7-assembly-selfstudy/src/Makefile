CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

SRC = basics.s loops.s functions.s memory.s io.s
OBJ = $(SRC:.s=.o)
TARGET = armv7-assembly

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) -o $@ $^

%.o: %.s
	$(AS) -o $@ $<

clean:
	rm -f $(OBJ) $(TARGET)