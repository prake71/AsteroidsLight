extends Node2D

signal shoot(bullet, rotation, location)

var bullet = preload("res://Bullet.tscn")



var direction = Vector2(0,0)
var screen_size
var d = 8

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation -= 2 * delta
	if Input.is_action_pressed("ui_right"):
		rotation += 2 * delta
	if Input.is_action_just_pressed("ui_select"):
		print(123)
		var this_bullet =  bullet.instance()
		emit_signal("shoot", this_bullet, rotation, position)
		
	
	var movedir = Vector2(1,0).rotated(rotation)
	#direction = direction.linear_interpolate(movedir, 0.05)
	
	if Input.is_action_pressed("ui_up"):
		direction = direction.linear_interpolate(movedir, 0.05)
	else:
		direction = direction.linear_interpolate(Vector2(0,0), 0.01)
	
	position += direction * 150 * delta
	
	position.x = wrapf(position.x, - d, screen_size.x + d)
	position.y = wrapf(position.y, - d, screen_size.y + d)


func _on_Area2D_area_entered(area):
	print("autsch2")
	get_tree().reload_current_scene()


