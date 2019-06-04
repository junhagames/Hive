// 리소스 로드 완료
var isResourceLoad = audio_group_is_loaded(audiogroup_bgm) && audio_group_is_loaded(audiogroup_sfx);

if (isResourceLoad) {
	room_goto_next();
}