extends Area

signal collected

func _ready():
	pass

func _physics_process(delta):
	rotate_y(deg2rad(-4))


func _on_coin_body_entered(body):
	if body.name == 'Player' && self.get_parent().visible:
		$AnimationPlayer.play("bounce")
		$Timer.start()
		$SFXCoin.play()


func _on_timer_timeout():
	emit_signal("collected")
	queue_free()
