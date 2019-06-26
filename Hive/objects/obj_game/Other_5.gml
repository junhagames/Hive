if (surface_exists(minimapSuf)) {
	surface_free(minimapSuf);
}

if (surface_exists(lightSuf)) {
	surface_free(lightSuf);
}
part_system_destroy(particleSys);
mp_grid_destroy(enemyPathGrid);
