if (other.hp <= damage) {
	instance_destroy(other);
}
else {
	other.hp -= damage;
}
instance_destroy();