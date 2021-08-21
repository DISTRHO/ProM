#!/usr/bin/make -f
# Makefile for DISTRHO Plugins #
# ---------------------------- #
# Created by falkTX
#

include dpf/Makefile.base.mk

all: dgl plugins resources gen

# --------------------------------------------------------------
# Check for system-wide projectM

HAVE_PROJECTM = $(shell pkg-config --exists libprojectM && echo true)

# --------------------------------------------------------------

dgl:
	$(MAKE) -C dpf/dgl opengl USE_OPENGL3=true

plugins: dgl
	$(MAKE) all -C plugins/ProM

ifneq ($(HAVE_PROJECTM),true)
resources: gen
	# LV2 fonts
	install -d bin/ProM.lv2/resources/fonts
	ln -sf $(CURDIR)/plugins/ProM/projectM/fonts/*.ttf bin/ProM.lv2/resources/fonts/
	# LV2 presets
	install -d bin/ProM.lv2/resources/presets
	ln -sf $(CURDIR)/plugins/ProM/projectM/presets/presets_* bin/ProM.lv2/resources/presets/
ifeq ($(MACOS),true)
	# VST fonts
	install -d bin/ProM.vst/Contents/Resources/fonts
	ln -sf $(CURDIR)/plugins/ProM/projectM/fonts/*.ttf bin/ProM.vst/Contents/Resources/fonts/
	# VST presets
	install -d bin/ProM.vst/Contents/Resources/presets
	ln -sf $(CURDIR)/plugins/ProM/projectM/presets/presets_* bin/ProM.vst/Contents/Resources/presets/
else
	# VST directory
	install -d bin/ProM.vst
	mv bin/ProM-vst$(LIB_EXT) bin/ProM.vst/ProM$(LIB_EXT)
	# VST fonts
	install -d bin/ProM.vst/resources/fonts
	ln -sf $(CURDIR)/plugins/ProM/projectM/fonts/*.ttf bin/ProM.vst/resources/fonts/
	# VST presets
	install -d bin/ProM.vst/resources/presets
	ln -sf $(CURDIR)/plugins/ProM/projectM/presets/presets_* bin/ProM.vst/resources/presets/
endif
else
resources:
endif

ifneq ($(CROSS_COMPILING),true)
gen: plugins dpf/utils/lv2_ttl_generator
	@$(CURDIR)/dpf/utils/generate-ttl.sh
ifeq ($(MACOS),true)
	@$(CURDIR)/dpf/utils/generate-vst-bundles.sh
endif

dpf/utils/lv2_ttl_generator:
	$(MAKE) -C dpf/utils/lv2-ttl-generator
else
gen:
endif

# --------------------------------------------------------------

clean:
	$(MAKE) clean -C dpf/dgl
	$(MAKE) clean -C dpf/utils/lv2-ttl-generator
	$(MAKE) clean -C plugins/ProM
	rm -rf bin build

# --------------------------------------------------------------

.PHONY: plugins
