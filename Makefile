MODELS = 0_CPU_naive
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