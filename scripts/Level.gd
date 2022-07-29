extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var coins = $Coins.get_children()
var totalCollected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Floor/MeshInstance.get_active_material(0).albedo_color = Color(
		rand_range(0, 1), rand_range(0, 1), rand_range(0, 1)
	)
	
	for coinHolder in coins:
		coinHolder.visible = false
	
	coins[int(rand_range(0, coins.size()))].visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_coin_collected():
	totalCollected += 1
	if (totalCollected == coins.size()):
		return
	var index = int(rand_range(0, coins.size()))
	while coins[index].visible:
		index = int(rand_range(0, coins.size()))
	print(index)
	coins[index].visible = true
