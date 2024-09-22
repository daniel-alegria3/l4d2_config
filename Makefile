L4D2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Left 4 Dead 2

# TODO: automatically modify gameinfo.txt
# TODO: the 'install' rule doesnt work properly (does not build pak01_dir.vpk)
install: pak01_dir.vpk autoexec.cfg
	mkdir -p "$(L4D2_ROOT_DIR)/mods"
	cp -f ./pak01_dir.vpk "$(L4D2_ROOT_DIR)/mods/pak01_dir.vpk"
	cp -f ./autoexec.cfg "$(L4D2_ROOT_DIR)/left4dead2/cfg/autoexec.cfg"

mods:
	vpk pak01_dir.vpk -x $@

pak01_dir.vpk:
	vpk pak01_dir.vpk -c mods -cv 1

.PHONY: install
