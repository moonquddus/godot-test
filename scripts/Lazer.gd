extends KinematicBody2D

var parent_rotation

func _ready():
	position = Vector2(position.x, position.y + 50)
	parent_rotation = get_parent().rotation

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, 2000).rotated(parent_rotation) * delta)
	if collision:
		detonate()

func _on_LazerTimer_timeout():
	detonate()
	


func detonate():
	get_parent().isShooting = false
	get_parent().remove_child(self)

func _on_Lazer_input_event(viewport, event, shape_idx):
	print(event)
