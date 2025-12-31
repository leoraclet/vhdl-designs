CC = ghdl
SIM = gtkwave
WORKDIR = debug

ARCHNAME?= tb_NAME
STOPTIME?= 100us

# Source files
VHDL_SOURCES += $(wildcard src/*.vhd)
# Testbench fiels
TBS = $(wildcard tb/tb_*.vhd)

CFLAGS += --warn-binding
CFLAGS += --warn-no-library # turn off warning on design replace with same name

.PHONY: all
all: check analyze
	@echo ">>> completed..."

.PHONY: check
check:
	@echo ">>> check syntax on all designs..."
	$(CC) -s $(CFLAGS) $(VHDL_SOURCES) $(TBS)

.PHONY: analyze
analyze:
	@echo ">>> analyzing designs..."
	mkdir -p $(WORKDIR)
	$(CC) -a $(CFLAGS) --workdir=$(WORKDIR) $(VHDL_SOURCES) $(TBS)

.PHONY: simulate
simulate: clean analyze
	@echo ">>> simulating design:" $(TB)
	$(CC) --elab-run $(CFLAGS) --workdir=$(WORKDIR) \
		-o $(WORKDIR)/$(ARCHNAME).bin $(ARCHNAME) \
		--vcd=$(WORKDIR)/$(ARCHNAME).vcd --stop-time=$(STOPTIME)
	@echo ">>> showing waveform for:" $(TB)
	$(SIM) $(WORKDIR)/$(ARCHNAME).vcd

.PHONY: clean
clean:
	@echo ">>> cleaning design..."
	ghdl --remove --workdir=$(WORKDIR)
	rm -f $(WORKDIR)/*
	rm -rf $(WORKDIR)
	@echo ">>> done..."
