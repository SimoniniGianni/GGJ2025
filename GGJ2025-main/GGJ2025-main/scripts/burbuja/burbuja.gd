extends Node

func _ready():
		$AnimationPlayer.play("burbuja")
		
func _on_hitbox_area_entered(area):
	print("perdiste");
	$PathFollow2D/burbuja/AnimatedSprite.play("death")
	$PathFollow2D/burbuja/Light2D.hide()
	$AnimationPlayer.stop()
