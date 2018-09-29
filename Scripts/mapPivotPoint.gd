extends Position2D
#Defines the rotation speed of the labyrinth
const rotationSpeed = 15;
var rotationPerPhysicsProcess = 0;

#Defines the number of times the turn button was pressed (Buffer)
var times = 0;
#Defines the number of times the labyrinth needs to rotate
var pendingRotations = 0;
#Defines the variable that will change the rotation by a specific factor
var rotationSpeedMultiplier = 1;

#Initialization starts here
func _ready():
	position = get_viewport().get_visible_rect().size/2;

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