if (!instance_exists(obj_transition_fadeout)) {
	if (global.sfxVolume > 0) {
		global.sfxVolume = 0;
	}
	else {
		global.sfxVolume = 1;
	}
	
	ini_open(SETTING_FILE);
	ini_write_real("settings", "sfxVolume", global.sfxVolume);
	ini_close();
}