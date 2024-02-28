TOP := top

SRC     := calculator 
RSC     := calculator
BUILD   := build
SEED    := 10
DEVICE  := up5k
PIN_DEF := $(RSC)/tt3_asic_sim.pcf
PACKAGE := sg48
FREQ    := 10

USB_VENDOR  ?= 1d50
USB_PRODUCT ?= 6146

SOURCES := $(shell fdfind '.*\.s?v' $(SRC))

VERBOSE ?= 0
ifeq ($(VERBOSE),1)
Q=
else
Q=@
endif

.PHONY: build prog clean
.PRECIOUS: $(BUILD)/%.json $(BUILD)/%.asc $(BUILD)/%.log

build: $(BUILD)/$(TOP).bin

prog_ice: $(BUILD)/$(TOP).bin
	$Qiceprog $<

prog: $(BUILD)/$(TOP).bin
	$Qdfu-util -R -d $(USB_VENDOR):$(USB_PRODUCT) -a 0 -D $<

clean:
	rm -rf $(BUILD)

$(BUILD)/:
	$Qmkdir -p $(BUILD)
	$Qecho '*' > $(BUILD)/.gitignore

$(BUILD)/%.json: $(SOURCES) | $(BUILD)/
	/home/grant/Downloads/oss-cad-suite-linux-x64-20231220/oss-cad-suite/bin/yosys \
		-l $(BUILD)/yosys.log \
		-DSYNTH \
		-p 'synth_ice40 -top $(basename $(notdir $@)) -json $@' \
		$^

$(BUILD)/%.asc: $(BUILD)/%.json | $(BUILD)/
	$Qnextpnr-ice40 \
		-l $(BUILD)/nextpnr.log \
		--pcf-allow-unconstrained \
		--seed $(SEED) \
		--freq $(FREQ) \
		--package $(PACKAGE) \
		--$(DEVICE) \
		--asc $@ \
		--pcf $(PIN_DEF) \
		--json $<

$(BUILD)/%.bin: $(BUILD)/%.asc | $(BUILD)/
	$Qicepack $< $@
