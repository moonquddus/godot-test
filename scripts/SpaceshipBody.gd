extends KinematicBody2D

var speed = 0
# rotation already exists in member class
var velocity = Vector2(0,speed).rotated(rotation)

var isShooting = false

var topSpeed = 1000
var topReverse = -50
var acceleration = 1
var turning = 1

func _ready():
	pass

func _process(delta):
	# handle movement
	var analogAcc = acceleration
	var analogTur = turning
	if Input.is_action_pressed("UP"):
		self.accelerate(analogAcc)
	if Input.is_action_pressed("DOWN"):
		self.accelerate(analogAcc * -1)
	if Input.is_action_pressed("LEFT"):
		self.steer(analogTur)
	if Input.is_action_pressed("RIGHT"):
		self.steer(analogTur * -1)
	velocity = Vector2(0, speed).rotated(rotation)
	move_and_collide(velocity * delta)
	
	# update ui
	get_tree().get_root().get_node("SpaceRoot/UICanvas/SpeedValue").set_text(String(speed))
	get_tree().get_root().get_node("SpaceRoot/UICanvas/RotationValue").set_text(String(round(rotation_degrees)))
	
	# handle fire
	if isShooting == false && Input.is_action_pressed("SHOOT"):
		self.fire()
	
func accelerate(amount):
	if amount > 0 && speed >= topSpeed:
		pass
	elif amount < 0 && speed <= topReverse:
		pass
	else:
		speed += amount
		
func steer(amount):
	rotation = rotation - deg2rad(amount)
	
func fire():
	isShooting = true
	var lazer = MyGlobals.lazer_node.instance()
	add_child(lazer)