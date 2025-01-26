extends CollisionShape2D


export var vel:float = 10000;
export var fuerza_salto:float = 200;
var estaEnElPiso = false;
var salta = false;

var anim;

export var pisoPath:NodePath;
var piso;

var pj;

var actions = [
	"mov_de",
	"mov_iz",
	"salto"
	];

var movx = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pj = get_parent();
	anim = get_parent().get_node("Sprite");
	piso = get_node(pisoPath);
	pass

func _process(delta):
	salta = false;
	movx = (Input.get_action_strength(actions[0]) - Input.get_action_strength(actions[1])) * vel * delta;

	if (Input.is_action_pressed(actions[2]) && estaEnElPiso):
		salta = true;

	if estaEnElPiso:
		if movx == 0:
			pj.cambiarEstado(pj.Estado.IDLE);
		elif movx < 0:
			pj.cambiarEstado(pj.Estado.MOVIZ);
		elif movx > 0:
			pj.cambiarEstado(pj.Estado.MOVDE);
	else:
		pj.cambiarEstado(pj.Estado.SALTA);


	pass

func _on_checkeaPiso_body_entered(body:Node):
	if (body.name == "piso"):
		print("piso");
		estaEnElPiso = true;
		pass
	pass

func _on_checkeaPiso_body_exited(body:Node):
	if (body.name == "piso"):
		print("piso");
		estaEnElPiso = false;
		pass
	pass
