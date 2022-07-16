extends Label

var collected = 0

func _ready():
	text = String(collected)

func _on_coin_collected():
	collected += 1
	text = String(collected)
	
	if collected == 14:
		$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene("res://scenes/win.tscn")
