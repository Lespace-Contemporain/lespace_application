#					     LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT

# Makefile written by ZOKOUALOUMBA MOUSSOUNDA EMMANUEL DIMITRI

ALR_COMPILE = alr build
GPR_COMPILE = gprbuild
PROJECT_FILE = lespace/lespace.gpr
NEXT = cd

 all:
	$(ADA_COMPILER) $(PROJECT_FILE)

build :
	$(NEXT) lespace/ && $(ALR_COMPILE)
run :
	$(NEXT) lespace/src/ && alr run

install :
	$(NEXT) lespace/ && alr toolchain --select
	$(NEXT) lespace/ && alr with gtkada

update :
	git add .
	git commit -m "first commit"
	git push -u origin main
