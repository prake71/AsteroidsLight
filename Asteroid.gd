extends Node2D

var velocity = Vector2(0,0)
var screen_size
var d = 8
var rotation_vel

func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	velocity = Vector2(randf()-0.5, randf()-0.5)
	rotation = randf()*3.14
	rotation_vel = randf()/1000
	position = Vector2(rand_range(0, screen_size.x), rand_range(0, screen_size.y))
	
func _process(delta):
	position += velocity * 200 * delta
	position.x = wrapf(position.x, -d, screen_size.x + d)
	position.y = wrapf(position.y, -d, screen_size.y + d)
	
	rotation += rotation_vel 
	
func _on_Area2D_area_entered(area):
	pass # Replace with function body.
