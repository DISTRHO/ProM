#!/usr/bin/make -f
# Makefile for DISTRHO Plugins #
# ---------------------------- #
# Created by falkTX
#

# NAME, OBJS_DSP and OBJS_UI have been defined before

include ../../Makefile.mk

# --------------------------------------------------------------
# Basic setup

TARGET_DIR = ../../bin

BUILD_C_FLAGS   += -I.
BUILD_CXX_FLAGS += -I. -I../../dpf/distrho -I../../dpf/dgl

# --------------------------------------------------------------
# Enable all possible plugin types

all: lv2 vst

# --------------------------------------------------------------
# Set plugin binary file targets

lv2 = $(TARGET_DIR)/$(NAME).lv2/$(NAME).$(EXT)
vst = $(TARGET_DIR)/$(NAME)-vst.$(EXT)

# TODO: MacOS VST bundle

# --------------------------------------------------------------
# Set distrho code files

DISTRHO_PLUGIN_FILES = ../../dpf/distrho/DistrhoPluginMain.cpp
DISTRHO_UI_FILES     = ../../dpf/distrho/DistrhoUIMain.cpp ../../dpf/libdgl.a

# --------------------------------------------------------------
# Common

%.c.o: %.c
	$(CC) $< $(BUILD_C_FLAGS) -c -o $@

%.cpp.o: %.cpp
	$(CXX) $< $(BUILD_CXX_FLAGS) -c -o $@

clean:
	rm -f *.o
	rm -rf $(TARGET_DIR)/$(NAME)-* $(TARGET_DIR)/$(NAME).lv2/

# --------------------------------------------------------------
# LV2

lv2: $(lv2)

$(lv2): $(OBJS_DSP) $(OBJS_UI) $(DISTRHO_PLUGIN_FILES) $(DISTRHO_UI_FILES)
	mkdir -p $(shell dirname $@)
	$(CXX) $^ $(BUILD_CXX_FLAGS) $(LINK_FLAGS) $(DGL_LIBS) $(shell pkg-config --libs libprojectM) -lpthread $(SHARED) -DDISTRHO_PLUGIN_TARGET_LV2 -o $@

# --------------------------------------------------------------
# VST

vst: $(vst)

$(vst): $(OBJS_DSP) $(OBJS_UI) $(DISTRHO_PLUGIN_FILES) $(DISTRHO_UI_FILES)
	mkdir -p $(shell dirname $@)
	$(CXX) $^ $(BUILD_CXX_FLAGS) $(LINK_FLAGS) $(DGL_LIBS) $(shell pkg-config --libs libprojectM) -lpthread $(SHARED) -DDISTRHO_PLUGIN_TARGET_VST -o $@

# --------------------------------------------------------------
