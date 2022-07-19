extends KinematicBody

const SPEED = 9

onready var cameraTarget = $CameraTarget

var ct_left = Vector3(7, 8, 0)
var ct_right = Vector3(-7, 8, 0)
var ct_backward = Vector3(0, 8, -7)
var ct_forward = Vector3(0, 8, 7)
var ct_dir = 'forward'

var direction = Vector3()
var velocity = Vector3()

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		rotate_camera_left()
	if Input.is_action_just_pressed("right"):
		rotate_camera_right()

	velocity.x = 0
	velocity.z = 0
		
	if ct_dir == 'forward':
		velocity.z = -SPEED
	elif ct_dir == 'left':
		velocity.x = -SPEED
	elif ct_dir == 'backward':
		velocity.z = SPEED
	else:
		velocity.x = SPEED
	
	move_and_slide(velocity, Vector3.UP)
	$MeshInstance.rotate_z(deg2rad(-velocity.x))
	$MeshInstance.rotate_x(deg2rad(velocity.z))

func rotate_camera_left():
	change_dir(true)
	cameraTarget.transform.origin = get_ct_dir()
	cameraTarget.rotate_y(deg2rad(90))

func rotate_camera_right():
	change_dir(false)
	cameraTarget.transform.origin = get_ct_dir()
	cameraTarget.rotate_y(deg2rad(-90))

func change_dir(isLeft):
	if ct_dir == 'forward':
		if isLeft:
			ct_dir = 'left'
		else:
			ct_dir = 'right'
	elif ct_dir == 'left':
		if isLeft:
			ct_dir = 'backward'
		else:
			ct_dir = 'forward'
	elif ct_dir == 'backward':
		if isLeft:
			ct_dir = 'right'
		else:
			ct_dir = 'left'
	else:
		if isLeft:
			ct_dir = 'forward'
		else:
			ct_dir = 'backward'

func get_ct_dir():
	if ct_dir == 'forward':
		return ct_forward
	elif ct_dir == 'left':
		return ct_left
	elif ct_dir == 'backward':
		return ct_backward
	else:
		return ct_right

func _on_enemy_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://scenes/GameOver.tscn")
