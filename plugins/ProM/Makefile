#!/usr/bin/make -f
# Makefile for DISTRHO Plugins #
# ---------------------------- #
# Created by falkTX
#

# --------------------------------------------------------------
# Project name, used for binaries

NAME = ProM

# --------------------------------------------------------------
# Files to build

OBJS_DSP = \
	DistrhoPluginProM.cpp.o

OBJS_UI  = \
	DistrhoUIProM.cpp.o

# --------------------------------------------------------------
# Do some magic

include ../Makefile.mk

# --------------------------------------------------------------
# Enable all possible plugin types

ifeq ($(LINUX),true)
all: jack lv2_one vst
else
all: lv2_one vst
endif

# --------------------------------------------------------------
