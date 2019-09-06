extends Node2D



func _ready():
	var asteroid = preload("res://Asteroid-big.tscn")
	for i in range(15):
		var a = asteroid.instance()
		add_child(a)

func _on_Player_shoot(bullet, rotation, position):
	print("in player shoot")
	add_child(bullet)
	bullet.rotation = rotation
	bullet.position = position
	bullet.velocity = bullet.velocity.rotated(rotation)	