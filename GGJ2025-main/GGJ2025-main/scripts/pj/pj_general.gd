extends RigidBody2D

enum Estado{
	IDLE,
	MOVIZ,
	MOVDE,
	SALTA
}
var estado;

var mov;
var ani;


# Called when the node enters the scene tree for the first time.
func _ready():
	mov = $hitbox;
	ani = $Sprite;
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	rotation_degrees = 0;
	state.linear_velocity.x = mov.movx;
	state.linear_velocity.y -= mov.fuerza_salto if mov.salta else 0;
	pass


func cambiarEstado(e):
	estado = e;
	pass

##TODO llenar la funcion esta cuando sepamos como es el tema de la vida
func restarVida():
	pass


#LADI DIMITRESCU

func _on_Area2D_area_entered(area):
	print("Entro")
	_muerte(false)


func _on_Area2D_area_exited(area):
	print("Salio")
	_muerte(true)

func _muerte(estado: bool):
	if estado:
		print("Muerte activada")
		$dimitrescu.show()
		$dimitrescu/AnimatedSprite.play("atacando")
		_iniciar_timer(9.0)
	else:
		print("Muerte desactivada")
		$dimitrescu.hide()
		$Timer.stop()
		$dimitrescu/AnimatedSprite.play("idle")
		
func _iniciar_timer(segundos: float):
	$Timer.wait_time = segundos
	$Timer.start()

func _on_Timer_timeout():
	print("9 segundos")
	$dimitrescu.hide() 
