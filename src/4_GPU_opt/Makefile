include ../../Include.mk

MODEL = 4_GPU_opt
FLAGS = $(OPENCV) $(OPENCL)
SRC_FILES := $(wildcard *.cpp)
SRC_FILES := $(filter-out main.cpp,$(SRC_FILES))
OBJ_FILES := $(patsubst %.cpp, %.o, $(SRC_FILES))


all:print train predict

print:
	echo $(SRC_FILES)
	echo $(OBJ_FILES)

train: $(OBJ_FILES) main_train.o
	@echo "building $(MODEL) :"
	@$(CC) -o ../../$(MODEL) $(OBJ_FILES) main_train.o $(FLAGS)
predict: $(OBJ_FILES) main_predict.o
	@echo "building $(MODEL)_Predict :"
	@$(CC) -o ../../$(MODEL)_Predict $(OBJ_FILES) main_predict.o $(FLAGS)

%.o: %.cpp cnn.h
	@echo "building $@ :"
	@$(CC) -c -o $@ $< $(FLAGS)

main_predict.o: main.cpp cnn.h
	@echo "building $@ :"
	@$(CC) -c -o $@ $< -DTEST_PREDICT $(FLAGS)

main_train.o: main.cpp cnn.h
	@echo "building $@ :"
	@$(CC) -c -o $@ $< $(FLAGS)

clean:
	-rm -rf *.o
	-rm -rf ../../$(MODEL)
	-rm -rf ../../$(MODEL)_Predict

.PONEY: train predict clean

