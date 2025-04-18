extends Camera3D

var lookSensitivity = 15.0
var minLookAngle = -180.0
var maxLookAngle = 180.0

var mouseDelta : Vector2 = Vector2()

@onready var player = get_parent()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _process(delta):
	var rot = Vector3(-mouseDelta.y, mouseDelta.x, 0) * lookSensitivity * delta
	
	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, minLookAngle, maxLookAngle)
	
	player.rotation_degrees.y -= rot.y
	
	mouseDelta = Vector2()
