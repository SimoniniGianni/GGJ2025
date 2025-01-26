extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Light2D.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemigo_body_entered(body:Node):
	if body.name == "player":
		$animaciones.animation = "activo";
		$activador.hide();
		$hitbox.show();
		$Light2D.show();
	pass # Replace with function body.


func _on_hitbox_body_entered(body:Node):
	if body.name == "player":
		body.restarVida();
	pass # Replace with function body.


func _muerte_planta(body:Node):
	$Light2D.hide();
	$animaciones.play("death")
	pass # Replace with function body.
