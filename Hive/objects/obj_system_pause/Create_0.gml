pauseSuf = surface_create(global.gameWidth * global.resolution, global.gameHeight * global.resolution);
surface_copy(pauseSuf, 0, 0, application_surface);
instance_deactivate_all(true);