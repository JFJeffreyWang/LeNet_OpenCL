
CC := g++ -std=c++11 -Wall -O3
OPENCL = -I/usr/local/include -L/usr/local/cuda/lib64 -lOpenCL 
OPENCV = $(shell pkg-config opencv --cflags --libs)