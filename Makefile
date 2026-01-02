# Shortends
CC = ghdl
SIM = gtkwave
WORKDIR = debug
QUIET = @

# Optional arguments
ARCHNAME?= tb_NAME
STOPTIME?= 100us

# Source files
VHDL_SOURCES += $(wildcard src/*.vhd)
VHDL_SOURCES += $(wildcard src/projects/*.vhd)
# Testbench files
TBS = $(wildcard src/tb/tb_*.vhd)

CFLAGS += --warn-binding
CFLAGS += --warn-no-library # turn off warning on design replace with same name
CFLAGS += -fsynopsys # This tells GHDL to resolve overloaded operators explicitly like Synopsys tools do
CFLAGS += -fexplicit #

.PHONY: all
all: check analyze
	@echo ">>> Completed..."

.PHONY: check
check:
	@echo ">>> Check syntax on all designs..."
	$(QUIET)$(CC) -s $(CFLAGS) $(VHDL_SOURCES) $(TBS)

.PHONY: analyze
analyze:
	@echo ">>> Analyzing designs..."
	$(QUIET)mkdir -p $(WORKDIR)
	$(QUIET)$(CC) -a $(CFLAGS) --workdir=$(WORKDIR) $(VHDL_SOURCES) $(TBS)

.PHONY: simulate
simulate: clean analyze
	@echo ">>> simulating design:" $(TB)
	$(QUIET)$(CC) --elab-run $(CFLAGS) --workdir=$(WORKDIR) \
		$(ARCHNAME) \
		--vcd=$(WORKDIR)/$(ARCHNAME).vcd --stop-time=$(STOPTIME)
	@echo ">>> showing waveform for:" $(TB)
	$(QUIET)$(SIM) $(WORKDIR)/$(ARCHNAME).vcd

.PHONY: clean
clean:
	@echo ">>> Cleaning design..."
	$(QUIET)ghdl --remove --workdir=$(WORKDIR)
	$(QUIET)rm -f $(WORKDIR)/*
	$(QUIET)rm -rf $(WORKDIR)
	@echo ">>> Done !"
