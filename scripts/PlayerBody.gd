extends KinematicBody2D

var playerAnimation

var isMoving = false
var movingUp = false
var movingDown = false
var movingLeft = false
var movingRight = false

var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	playerAnimation = get_node("PlayerAnimation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vectorx = 0
	var vectory = 0

	if movingUp == true or movingDown == true or movingLeft == true or movingRight == true:
		isMoving = true
		playerAnimation.playing = true
	else:
		isMoving = false
		playerAnimation.playing = false
		playerAnimation.frame = 1
		move_and_collide(Vector2(0,0))

	if isMoving:
		if movingUp == true:
			vectory -= (speed * delta)
		if movingDown == true:
			vectory += (speed * delta)
		if movingLeft == true:
			vectorx -= (speed * delta)
		if movingRight == true:
			vectorx += (speed * delta)
		move_and_collide(Vector2(vectorx, vectory))

func _input(event):
	if event.is_action_pressed("UP"):
		if isMoving == false:
			playerAnimation.animation = "moveUp"
		movingUp = true
	elif event.is_action_released("UP"):
		movingUp = false

	if event.is_action_pressed("DOWN"):
		if isMoving == false:
			playerAnimation.animation = "moveDown"
		movingDown = true
	elif event.is_action_released("DOWN"):
		movingDown = false

	if event.is_action_pressed("LEFT"):
		if isMoving == false:
			playerAnimation.animation = "moveLeft"
		movingLeft = true
	elif event.is_action_released("LEFT"):
		movingLeft = false

	if event.is_action_pressed("RIGHT"):
		if isMoving == false:
			playerAnimation.animation = "moveRight"
		movingRight = true
	elif event.is_action_released("RIGHT"):
		movingRight = false