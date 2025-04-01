extends CharacterBody3D

@export var speed = 3
var default_speed = speed
var double_speed = speed * 2

@onready var camera = $CameraOrbit

func _physics_process(_delta):
	var direction = Vector3()
	if Input.is_action_pressed("forward"):
		direction.z -= 1
	if Input.is_action_pressed("back"):
		direction.z += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("increase_speed"):
		speed = double_speed
	else:
		speed = default_speed
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()

	var facing = (transform.basis.x * direction.x + transform.basis.y * direction.y + transform.basis.z * direction.z)
	velocity = speed * facing
	
	move_and_slide()
