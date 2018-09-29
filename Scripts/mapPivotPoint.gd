extends Position2D


#defines the rotation speed of the labyrinth
var rotationPerPhysicsProcess = 0;


var times = 0;
var pendingRotations = 0;
const rotationSpeed = 15;
var rotationSpeedMultiplier = 1;

func _ready():
	position = get_viewport().get_visible_rect().size/2;
	pass

func _physics_process(delta):
	if times != 0:
		rotate(rotationPerPhysicsProcess);
		times -= 1;
		pendingRotations = ceil(times/15.0);
	else:
		rotationPerPhysicsProcess = 0;

func _on_right_arrow_pressed():
	if rotationPerPhysicsProcess >= 0:
		times += rotationSpeed*rotationSpeedMultiplier;
	else:
		times = pendingRotations * rotationSpeed*rotationSpeedMultiplier - times;
	rotationPerPhysicsProcess = (PI/2)/rotationSpeed*rotationSpeedMultiplier;
	
func _on_left_arrow_pressed():
	if rotationPerPhysicsProcess <= 0:
		times += 15;
	else:
		times = pendingRotations * rotationSpeed*rotationSpeedMultiplier - times;
	rotationPerPhysicsProcess = -(PI/2)/rotationSpeed*rotationSpeedMultiplier;