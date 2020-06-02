MODELS = 0_CPU_naive 1_CPU_loop_opt 2_CPU_SIMD 3_GPU_naive 4_GPU_opt
PROJECTS = $(shell find $(addprefix src/,$(MODELS)) -name Makefile)

%.build :
	@echo "executing $*'s Makefile:"
	@$(MAKE) -C $(dir $*)

%.clean :
	@echo "executing $*'s make clean:"
	@$(MAKE) -C $(dir $*) clean

all:  $(addsuffix .build,$(PROJECTS))
	@echo "Finished building all models"

clean:  $(addsuffix .clean,$(PROJECTS))
	@echo "Finished clean"