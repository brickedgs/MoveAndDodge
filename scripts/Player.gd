extends KinematicBody

const SPEED = 9

var direction = Vector3()
var velocity = Vector3()

func _ready():
	pass

func _physics_process(delta):
	direction = Vector3()
	var isMovingZ = true
	var isMovingX = true
	
	if Input.is_action_pressed("forward") and Input.is_action_pressed("backward"):
		direction.z = 0
	elif Input.is_action_pressed("forward"):
		direction.z = -1
	elif Input.is_action_pressed("backward"):
		direction.z = 1
	else:
		velocity.z = lerp(velocity.z, 0, delta * 4)
		isMovingZ = false

	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		direction.x = 0
	elif Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = 1
	else:
		velocity.x = lerp(velocity.x, 0, delta * 4)
		isMovingX = false

	direction = direction.normalized()
	
	if isMovingZ:
		velocity.z = direction.z * SPEED
	if isMovingX:
		velocity.x = direction.x * SPEED
	
	move_and_slide(velocity, Vector3.UP)
	$MeshInstance.rotate_z(deg2rad(-velocity.x))
	$MeshInstance.rotate_x(deg2rad(velocity.z))


func _on_enemy_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://scenes/GameOver.tscn")
