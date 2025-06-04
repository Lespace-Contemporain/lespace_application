#							LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT

# Makefile written by ZOKOUALOUMBA MOUSSOUNDA EMMANUEL DIMITRI

ADA_COMPILER = gprbuild
PROJECT_FILE = lespace/lespace.gpr

build :
	$(ADA_COMPILER) $(PROJECT_FILE)
install :
	cd lespace/ && alr with gtkada
