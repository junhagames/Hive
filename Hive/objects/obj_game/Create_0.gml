lightSuf = surface_create(global.gameWidth, global.gameHeight);
damageAlpha = 0;

if (global.time < room_speed * 40) {
	lightAlpha = 0;
}
else if (global.time < room_speed * 80) {
	lightAlpha = 0.5;
}
else if (global.time < room_speed * 120) {
	lightAlpha = 0.9;
}
else if (global.time < room_speed * 160) {
	lightAlpha = 0;
}

// 파티클 생성기
particleSys = part_system_create();
emitterFlame = part_emitter_create(particleSys);