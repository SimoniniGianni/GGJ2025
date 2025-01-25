extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var vel = 200;
var actions = [
	"mov_de",
	"mov_iz"
	];

var movx = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if Input.action
	movx = (Input.get_action_strength(actions[0]) - Input.get_action_strength(actions[1])) * vel;
	#add_force(Vector2(0,0), Vector2(movx,0));
	#applied_force = Vector2(clamp(applied_force.x,0,100),applied_force.y);
	#global_position.x = global_position.x ;
	

	pass

func _integrate_forces(state):
	rotation_degrees = 0;
	state.linear_velocity.x = movx;
	pass
