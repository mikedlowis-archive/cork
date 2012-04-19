###############################################################################
#
# Name:    Cork
# Type:    Library
# Author:  Mike Lowis
# License: BSD 2-Clause
#
###############################################################################

# Project and Artifact Names
#---------------------------
PROJ_NAME   = cork
SHARED_NAME = lib$(PROJ_NAME).lib
STATIC_NAME = lib$(PROJ_NAME).a

# File and Directory Settings
#----------------------------
SRC_ROOT  = source/
SRC_FTYPE = cpp
SRC_FILES = $(shell find $(SRC_ROOT) -name *.$(SRC_FTYPE) -print)
OBJ_FILES = $(SRC_FILES:%.$(SRC_FTYPE)=%.o)
SRC_DIRS  = $(dir $(SRC_FILES))
INC_DIRS  = $(addprefix -I,$(SRC_DIRS))

# Compiler and Linker Options
#----------------------------
CXXFLAGS = $(INC_DIRS) -Wall -fPIC
ARFLAGS  = rcs

# Build Rules
#------------
all: shared static
shared: $(SHARED_NAME)
static: $(STATIC_NAME)

$(SHARED_NAME): $(OBJ_FILES)
	$(CXX) $(CXX_FLAGS) -shared -o $@ $(OBJ_FILES)

$(STATIC_NAME): $(OBJ_FILES)
	$(AR) $(ARFLAGS) $@ $(OBJ_FILES)

$(OBJ_FILES): %.o : %.$(SRC_FTYPE)

clean:
	$(RM) $(foreach dir,$(SRC_DIRS), $(dir)*.o)
	$(RM) $(SHARED_NAME)
	$(RM) $(STATIC_NAME)

