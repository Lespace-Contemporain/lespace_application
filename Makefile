#####################################################################
#								   ##
#		LESPACE CONTEMPORAIN SOFTWARE DEVELOPMENT	   ##
#								   ##
# Makefile written by ZOKOUALOUMBA MOUSSOUNDA EMMANUEL DIMITRI	   ##
#								   ##
# This Makefile building the lespace application for different	   ##
# targets : Linux, Window, MacOS, Android, Apple
#####################################################################

ALR_COMPILE = alr build
GPR_COMPILE = gprbuild
PROJECT_FILE = lespace/lespace.gpr
NEXT = cd

#		LINUX BUILD SYSTEM

linux :
	$(NEXT) lespace/ && $(ALR_COMPILE)
linux-run :
	$(NEXT) lespace/ && alr run

install :
	$(NEXT) lespace/ && alr toolchain --select
	$(NEXT) lespace/ && alr with gtkada

update :
	git add .
	git commit -m "first commit"
	git push -u origin main
