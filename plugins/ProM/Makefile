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

FILES_DSP = \
	DistrhoPluginProM.cpp

FILES_UI  = \
	DistrhoUIProM.cpp

# --------------------------------------------------------------
# Check for system-wide projectM

HAVE_PROJECTM = $(shell pkg-config --exists libprojectM && echo true)

# --------------------------------------------------------------
# Use local copy if needed

ifneq ($(HAVE_PROJECTM),true)
FILES_UI += \
	projectM/src/libprojectM/ConfigFile.cpp \
	projectM/src/libprojectM/FileScanner.cpp \
	projectM/src/libprojectM/KeyHandler.cpp \
	projectM/src/libprojectM/PCM.cpp \
	projectM/src/libprojectM/PipelineMerger.cpp \
	projectM/src/libprojectM/Preset.cpp \
	projectM/src/libprojectM/PresetChooser.cpp \
	projectM/src/libprojectM/PresetFactory.cpp \
	projectM/src/libprojectM/PresetFactoryManager.cpp \
	projectM/src/libprojectM/PresetLoader.cpp \
	projectM/src/libprojectM/TimeKeeper.cpp \
	projectM/src/libprojectM/fftsg.cpp \
	projectM/src/libprojectM/projectM.cpp \
	projectM/src/libprojectM/timer.cpp \
	projectM/src/libprojectM/wipemalloc.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/BuiltinFuncs.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/BuiltinParams.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/CustomShape.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/CustomWave.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/Eval.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/Expr.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/Func.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/IdlePreset.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/InitCond.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/MilkdropPreset.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/MilkdropPresetFactory.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/Param.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/Parser.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/PerFrameEqn.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/PerPixelEqn.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/PerPointEqn.cpp \
	projectM/src/libprojectM/MilkdropPresetFactory/PresetFrameIO.cpp \
	projectM/src/libprojectM/NativePresetFactory/NativePresetFactory.cpp \
	projectM/src/libprojectM/Renderer/BeatDetect.cpp \
	projectM/src/libprojectM/Renderer/Renderable.cpp \
	projectM/src/libprojectM/Renderer/Filters.cpp \
	projectM/src/libprojectM/Renderer/Renderer.cpp \
	projectM/src/libprojectM/Renderer/MilkdropWaveform.cpp \
	projectM/src/libprojectM/Renderer/Shader.cpp \
	projectM/src/libprojectM/Renderer/PerPixelMesh.cpp \
	projectM/src/libprojectM/Renderer/ShaderEngine.cpp \
	projectM/src/libprojectM/Renderer/PerlinNoise.cpp \
	projectM/src/libprojectM/Renderer/StaticGlShaders.cpp \
	projectM/src/libprojectM/Renderer/PerlinNoiseWithAlpha.cpp \
	projectM/src/libprojectM/Renderer/Texture.cpp \
	projectM/src/libprojectM/Renderer/Pipeline.cpp \
	projectM/src/libprojectM/Renderer/TextureManager.cpp \
	projectM/src/libprojectM/Renderer/PipelineContext.cpp \
	projectM/src/libprojectM/Renderer/VideoEcho.cpp \
	projectM/src/libprojectM/Renderer/RenderItemDistanceMetric.cpp \
	projectM/src/libprojectM/Renderer/Waveform.cpp \
	projectM/src/libprojectM/Renderer/RenderItemMatcher.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/CodeWriter.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/HLSLParser.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/Engine.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/HLSLTokenizer.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/GLSLGenerator.cpp \
	projectM/src/libprojectM/Renderer/hlslparser/src/HLSLTree.cpp \
	projectM/src/libprojectM/Renderer/SOIL2/SOIL2.c \
	projectM/src/libprojectM/Renderer/SOIL2/image_DXT.c \
	projectM/src/libprojectM/Renderer/SOIL2/etc1_utils.c \
	projectM/src/libprojectM/Renderer/SOIL2/image_helper.c
endif

# --------------------------------------------------------------
# Do some magic

include ../../dpf/Makefile.plugins.mk

# --------------------------------------------------------------
# Extra flags

ifeq ($(HAVE_PROJECTM),true)
BASE_FLAGS += -DPROJECTM_DATA_DIR='"$(shell pkg-config --variable=pkgdatadir libprojectM)"'
BASE_FLAGS += $(shell pkg-config --cflags libprojectM)
LINK_FLAGS += $(shell pkg-config --libs libprojectM)
else
# include dirs
BASE_FLAGS += -IprojectM/src
BASE_FLAGS += -IprojectM/src/libprojectM
BASE_FLAGS += -IprojectM/src/libprojectM/Renderer
BASE_FLAGS += -IprojectM/src/libprojectM/Renderer/hlslparser/src
BASE_FLAGS += -IprojectM/src/libprojectM/MilkdropPresetFactory
BASE_FLAGS += -IprojectM/src/libprojectM/NativePresetFactory
BASE_FLAGS += -IprojectM/vendor
# compiler macros
BASE_FLAGS += -Dprojectm_mac=1
BASE_FLAGS += -DHAVE_ALIGNED_ALLOC=1
BASE_FLAGS += -DHAVE_DLFCN_H=1
BASE_FLAGS += -DHAVE_FTS_H=1
BASE_FLAGS += -DHAVE_GL=1
# BASE_FLAGS += -DHAVE_GLES_GL_H=1
BASE_FLAGS += -DHAVE_GL_GL_H=1
BASE_FLAGS += -DHAVE_INTTYPES_H=1
# BASE_FLAGS += -DHAVE_LLVM=1
BASE_FLAGS += -DHAVE_MEMORY_H=1
BASE_FLAGS += -DHAVE_OPENGL_GL_H=1
BASE_FLAGS += -DHAVE_POSIX_MEMALIGN=1
BASE_FLAGS += -DHAVE_PTHREAD_PRIO_INHERIT=1
BASE_FLAGS += -DHAVE_STDINT_H=1
BASE_FLAGS += -DHAVE_STDLIB_H=1
BASE_FLAGS += -DHAVE_STRINGS_H=1
BASE_FLAGS += -DHAVE_STRING_H=1
BASE_FLAGS += -DHAVE_SYS_STAT_H=1
BASE_FLAGS += -DHAVE_SYS_TYPES_H=1
BASE_FLAGS += -DHAVE_UNISTD_H=1
BASE_FLAGS += -DHAVE_WINDOWS_H=1
BASE_FLAGS += -DSTDC_HEADERS=1
# BASE_FLAGS += -DUSE_GLES=1
BASE_FLAGS += -DUSE_THREADS=1
# self-contained build
BASE_FLAGS += -DDATADIR_PATH='"."'
# silence projectM warnings
BASE_FLAGS += -Wno-constant-conversion
BASE_FLAGS += -Wno-delete-non-abstract-non-virtual-dtor
BASE_FLAGS += -Wno-ignored-qualifiers
BASE_FLAGS += -Wno-mismatched-tags
BASE_FLAGS += -Wno-sign-compare
BASE_FLAGS += -Wno-unused-parameter
BASE_FLAGS += -Wno-unused-variable
# maybe maybe
# projectm_mac
# -fopenmp
endif

LINK_FLAGS += -lpthread

# --------------------------------------------------------------
# Enable all possible plugin types

TARGETS += jack
TARGETS += lv2
TARGETS += vst

all: $(TARGETS)

# --------------------------------------------------------------
