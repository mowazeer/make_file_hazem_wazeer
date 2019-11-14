vpath %.o ./dependencies
vpath %.h ./inc
vpath %.c ./src
source_path  := src/
include_path := inc/


# Sources files.
src_files = $(source_path)DIO.c \
			$(source_path)LCD.c \
			$(source_path)main.c \
			$(source_path)code.c

# include files.
include_files = inc/code.h \
				inc/DIO.h  \
				inc/LCD.h  \
				inc/main.h

objects_files      = DIO.o LCD.o main.o code.o
objects_files_path = dependencies/
#complier.
CC = gcc_S 

#compiler flags.
CCFLAGS = -c
PRFLAGS = -I$(include_path)
#target.
TARGET  = quiz.exe  


# output object files.
%.o : $(source_path)%.c
	$(CC) $(PRFLAGS) $(CCFLAGS) $^ -o $(objects_files_path)$@


compile : $(objects_files)

$(TARGET) : compile
	$(CC) $(objects_files_path)*.o -o $(TARGET)

.PHONY : clean 


clean :
	rm $(TARGET) $(objects_files_path)*.o