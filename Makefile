CC = ghdl
SIM = gtkwave
WORKDIR = debug
QUIET = @

ARCHNAME?= tb_NAME
STOPTIME?= 100us

# Source files
VHDL_SOURCES += $(wildcard src/*.vhd)
# Testbench fiels
TBS = $(wildcard tb/tb_*.vhd)

CFLAGS += --warn-binding
CFLAGS += --warn-no-library # turn off warning on design replace with same name
CFLAGS += -fsynopsys # This tells GHDL to resolve overloaded operators explicitly like Synopsys tools do
CFLAGS += -fexplicit #

.PHONY: all
all: check analyze
	@echo ">>> completed..."

.PHONY: check
check:
	@echo ">>> check syntax on all designs..."
	$(QUIET)$(CC) -s $(CFLAGS) $(VHDL_SOURCES) $(TBS)

.PHONY: analyze
analyze:
	@echo ">>> analyzing designs..."
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
	@echo ">>> cleaning design..."
	$(QUIET)ghdl --remove --workdir=$(WORKDIR)
	$(QUIET)rm -f $(WORKDIR)/*
	$(QUIET)rm -rf $(WORKDIR)
	@echo ">>> done..."
