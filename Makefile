L4D2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Left 4 Dead 2

# TODO: automatically modify gameinfo.txt
install: pak01_dir.vpk autoexec.cfg
	mkdir -p "$(L4D2_ROOT_DIR)/mods"
	cp -f ./pak01_dir.vpk "$(L4D2_ROOT_DIR)/mods/pak01_dir.vpk"
	cp -f ./autoexec.cfg "$(L4D2_ROOT_DIR)/left4dead2/cfg/autoexec.cfg"

extract:
	vpk pak01_dir.vpk -x mods

pak01_dir.vpk:
	vpk pak01_dir.vpk -c mods -cv 1

# TODO: pak01_dir.vpk should not be phony
.PHONY: install extract pak01_dir.vpk
