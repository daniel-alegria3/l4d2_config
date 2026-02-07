L4D2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Left 4 Dead 2
GAMEINFO = $(L4D2_ROOT_DIR)/left4dead2/gameinfo.txt
CFG = $(L4D2_ROOT_DIR)/left4dead2/cfg/
AUTOEXEC = $(L4D2_ROOT_DIR)/left4dead2/cfg/autoexec.cfg
VIDEOEXEC = $(L4D2_ROOT_DIR)/left4dead2/cfg/video.txt
SPRAY_DIR = $(L4D2_ROOT_DIR)/left4dead2/materials/vgui/logos/custom

MODS_FOLDER=mods

# TODO: automatically modify gameinfo.txt
install: autoexec.cfg
	cp -f ./autoexec.cfg "$(AUTOEXEC)"
	cp -f ./lastinv.cfg "$(CFG)"
	cp -f ./video.txt "$(VIDEOEXEC)"
	mkdir -p "$(L4D2_ROOT_DIR)/$(MODS_FOLDER)"
	cp -f ./pak01_dir.vpk "$(L4D2_ROOT_DIR)/$(MODS_FOLDER)"
	grep -q "Game\s*$(MODS_FOLDER)" "$(GAMEINFO)" || sed -i '/Game\s*update/i\Game $(MODS_FOLDER)' "$(GAMEINFO)"
	mkdir -p "$(SPRAY_DIR)"
	cp -f ./spray_danidev.vmt "$(SPRAY_DIR)"
	cp -f ./spray_danidev.vtf "$(SPRAY_DIR)"

extract:
	vpk pak01_dir.vpk -x mods

pak01_dir.vpk:
	vpk pak01_dir.vpk -c mods -cv 1

# TODO: pak01_dir.vpk should not be phony
.PHONY: install extract pak01_dir.vpk
