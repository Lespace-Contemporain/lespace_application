#					     LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT

# Makefile written by ZOKOUALOUMBA MOUSSOUNDA EMMANUEL DIMITRI

ADA_COMPILER = gprbuild
PROJECT_FILE = lespace/lespace.gpr
NEXT = cd

build :
	$(ADA_COMPILER) $(PROJECT_FILE)

install :
	$(NEXT) lespace/ && alr toolchain --select
	$(NEXT) lespace/ && alr with gtkada

update :
	git add .
	git commit -m "first commit"
	git push -u origin main
