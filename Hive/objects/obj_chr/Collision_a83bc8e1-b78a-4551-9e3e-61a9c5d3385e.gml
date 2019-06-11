global.chrMap[? "coin"]++;
scr_vfx_text(random_range(other.x - 15, other.x + 15), other.y - other.sprite_height, "코인 " + string(global.chrMap[? "coin"]), c_yellow);
instance_destroy(other);