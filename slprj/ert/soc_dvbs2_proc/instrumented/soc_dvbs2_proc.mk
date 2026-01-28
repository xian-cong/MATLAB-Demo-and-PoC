###########################################################################
## Makefile generated for component 'soc_dvbs2_proc'. 
## 
## Makefile     : soc_dvbs2_proc.mk
## Generated on : Fri Dec 05 09:39:36 2025
## Final product: ./soc_dvbs2_proc_rtwlib.lib
## Product type : static library
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# MODELLIB                Static library target

PRODUCT_NAME              = soc_dvbs2_proc
MAKEFILE                  = soc_dvbs2_proc.mk
MATLAB_ROOT               = C:/PROGRA~1/MATLAB/R2025b
MATLAB_BIN                = C:/PROGRA~1/MATLAB/R2025b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = C:/demo/DVBS2ReceiverSoCExample
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ../../../..
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 
MODELLIB                  = soc_dvbs2_proc_rtwlib.lib

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          Linaro AArch64 Linux v6.3.1
# Supported Version(s):    
# ToolchainInfo Version:   2025b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# TARGET_LOAD_CMD_ARGS
# TARGET_PKG_INSTALLDIR
# LINARO_TOOLCHAIN_6_3_1_AARCH64

#-----------
# MACROS
#-----------

SHELL                          = %SystemRoot%/system32/cmd.exe
CCOUTPUTFLAG                   = --output_file=
LDOUTPUTFLAG                   = --output_file=

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm -lm

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# Assembler: Linaro Toolchain6.3.1 Assembler
AS_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
AS = $(AS_PATH)/aarch64-linux-gnu-as

# C Compiler: Linaro Toolchain6.3.1 C Compiler
CC_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
CC = $(CC_PATH)/aarch64-linux-gnu-gcc

# Linker: Linaro Toolchain6.3.1 Linker
LD_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
LD = $(LD_PATH)/aarch64-linux-gnu-gcc

# C++ Compiler: Linaro Toolchain6.3.1 C++ Compiler
CPP_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
CPP = $(CPP_PATH)/aarch64-linux-gnu-g++

# C++ Linker: Linaro Toolchain6.3.1 C++ Linker
CPP_LD_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
CPP_LD = $(CPP_LD_PATH)/aarch64-linux-gnu-g++

# Archiver: Linaro Toolchain6.3.1 Archiver
AR_PATH = $(LINARO_TOOLCHAIN_6_3_1_AARCH64)
AR = $(AR_PATH)/aarch64-linux-gnu-ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = $(MEX_PATH)/mex

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%\bin\win64
MAKE = $(MAKE_PATH)/gmake


#-------------------------
# Directives/Utilities
#-------------------------

ASDEBUG             = -g
AS_OUTPUT_FLAG      = -o
CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @del /F
ECHO                = @echo
MV                  = @move
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = -ruvs
ASFLAGS              = -c \
                       $(ASFLAGS_ADDITIONAL) \
                       $(INCLUDES)
CFLAGS               = -c \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -O0
CPPFLAGS             = -c \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -O2
CPP_LDFLAGS          = -lm -lrt -lpthread -ldl
CPP_SHAREDLIB_LDFLAGS  = -shared  \
                         -lm -lrt -lpthread -ldl
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              = -lm -lrt -lpthread -ldl
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = -shared  \
                       -lm -lrt -lpthread -ldl



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = ./soc_dvbs2_proc_rtwlib.lib
PRODUCT_TYPE = "static library"
BUILD_TYPE = "Model Reference Library"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I$(MATLAB_ROOT)/toolbox/shared/soc/processor/include -I$(MATLAB_ROOT)/toolbox/target/shared/ioplayback/include -IC:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/include -I$(START_DIR)/slprj/ert/soc_dvbs2_proc -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert -I$(START_DIR)/slprj/ert/_sharedutils -IC:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/zynq/src -IC:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/zynq/include -IC:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/target/supportpackages/arm_cortex_a/include -I$(MATLAB_ROOT)/toolbox/target/codertarget/rtos/inc

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=1 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0
DEFINES_C_OPTS = -D_GNU_SOURCE
DEFINES_CUSTOM = 
DEFINES_OPTS = -DTID01EQ=0
DEFINES_SKIPFORSIL = -DARM_PROJECT -DMW_EXTMODE_RECV_TIMEOUT_USEC=10 -DSTACK_SIZE=64 -DRT
DEFINES_STANDARD = -DMODEL=soc_dvbs2_proc -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_C_OPTS) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/mw_axi_register.c $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/mw_linux_udp.c $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/MW_linuxUDP.c C:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/src/iio_helper.c $(START_DIR)/slprj/ert/soc_dvbs2_proc/soc_dvbs2_proc.c $(START_DIR)/slprj/ert/soc_dvbs2_proc/soc_dvbs2_proc_data.c

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = mw_axi_register.c.o mw_linux_udp.c.o MW_linuxUDP.c.o iio_helper.c.o soc_dvbs2_proc.c.o soc_dvbs2_proc_data.c.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_C_OPTS = -std=c99
CFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1
CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_C_OPTS) $(CFLAGS_SKIPFORSIL) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_SKIPFORSIL) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_ = -liio -lxml2 -lz -lserialport -lusb-1.0
CPP_LDFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1 -lstdc++ -lboost_system -lboost_date_time -lboost_chrono -lboost_thread -lpthread -lboost_unit_test_framework --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1

CPP_LDFLAGS += $(CPP_LDFLAGS_) $(CPP_LDFLAGS_SKIPFORSIL)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_ = -liio -lxml2 -lz -lserialport -lusb-1.0
CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1 -lstdc++ -lboost_system -lboost_date_time -lboost_chrono -lboost_thread -lpthread -lboost_unit_test_framework --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_) $(CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL)

#-----------
# Linker
#-----------

LDFLAGS_ = -liio -lxml2 -lz -lserialport -lusb-1.0
LDFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1 -lstdc++ -lboost_system -lboost_date_time -lboost_chrono -lboost_thread -lpthread -lboost_unit_test_framework --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1

LDFLAGS += $(LDFLAGS_) $(LDFLAGS_SKIPFORSIL)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_ = -liio -lxml2 -lz -lserialport -lusb-1.0
SHAREDLIB_LDFLAGS_SKIPFORSIL = --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1 -lstdc++ -lboost_system -lboost_date_time -lboost_chrono -lboost_thread -lpthread -lboost_unit_test_framework --sysroot=C:/PROGRA~3/MATLAB/SUPPOR~1/R2025b/3P778C~1.INS/XILINX~2.INS/SYSROO~1

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_) $(SHAREDLIB_LDFLAGS_SKIPFORSIL)

###########################################################################
## INLINED COMMANDS
###########################################################################


ALL_DEPS:=$(patsubst %.o,%.dep,$(ALL_OBJS))
all:




-include codertarget_assembly_flags.mk
-include ../codertarget_assembly_flags.mk
-include $(ALL_DEPS)


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


prebuild : 


download : $(PRODUCT)


execute : download


###########################################################################
## FINAL TARGET
###########################################################################

#---------------------------------
# Create a static library         
#---------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	@echo "### Creating static library "$(PRODUCT)" ..."
	$(AR) $(ARFLAGS)  $(PRODUCT) $(OBJS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.c.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(RELATIVE_PATH_TO_ANCHOR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(START_DIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : C:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : C:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/src/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : C:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(START_DIR)/slprj/ert/soc_dvbs2_proc/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(START_DIR)/slprj/ert/soc_dvbs2_proc/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(START_DIR)/slprj/ert/soc_dvbs2_proc/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(MATLAB_ROOT)/rtw/c/src/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(MATLAB_ROOT)/simulink/src/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


%.c.o : ../%.c
	$(CC) $(CFLAGS) -o $@ $<


%.s.o : ../%.s
	$(AS) $(ASFLAGS) -o $@ $<


%.pp.o : ../%.cpp
	$(CPP) $(CPPFLAGS) -o $@ $<


mw_axi_register.c.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/mw_axi_register.c
	$(CC) $(CFLAGS) -o $@ $<


mw_linux_udp.c.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/mw_linux_udp.c
	$(CC) $(CFLAGS) -o $@ $<


MW_linuxUDP.c.o : $(MATLAB_ROOT)/toolbox/shared/soc/processor/src/MW_linuxUDP.c
	$(CC) $(CFLAGS) -o $@ $<


iio_helper.c.o : C:/ProgramData/MATLAB/SupportPackages/R2025b/toolbox/shared/libiio/base/src/iio_helper.c
	$(CC) $(CFLAGS) -o $@ $<


soc_dvbs2_proc.c.o : $(START_DIR)/slprj/ert/soc_dvbs2_proc/soc_dvbs2_proc.c
	$(CC) $(CFLAGS) -o $@ $<


soc_dvbs2_proc_data.c.o : $(START_DIR)/slprj/ert/soc_dvbs2_proc/soc_dvbs2_proc_data.c
	$(CC) $(CFLAGS) -o $@ $<


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### ASFLAGS = $(ASFLAGS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(subst /,\,$(PRODUCT))
	$(RM) $(subst /,\,$(ALL_OBJS))
	$(RM) *.c.dep
	$(RM) *.cpp.dep
	$(RM) *.s.dep
	$(ECHO) "### Deleted all derived files."


