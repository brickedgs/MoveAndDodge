extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Floor/MeshInstance.get_active_material(0).albedo_color = Color(
		rand_range(0, 1), rand_range(0, 1), rand_range(0, 1)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
