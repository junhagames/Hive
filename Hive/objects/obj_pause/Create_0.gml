// 어플리케이션 서피스 복사
pauseSuf = surface_create(global.gameWidth * global.resolution, global.gameHeight * global.resolution);
surface_set_target(pauseSuf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
surface_copy(pauseSuf, 0, 0, application_surface);

// 일시정지 스프라이트 생성
spr_pause = sprite_create_from_surface(pauseSuf, 0, 0, surface_get_width(pauseSuf), surface_get_height(pauseSuf), false, false, 0, 0);
surface_free(pauseSuf);

// 모든 인스턴스 비활성화 설정
instance_deactivate_all(true);