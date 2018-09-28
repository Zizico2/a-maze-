extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const gravity = 10;
var gravity_multiplier = 1;
var motion = Vector2(0,0);

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	motion.y -= gravity * gravity_multiplier;
	if test_move(global_transform, delta*motion):
		motion.y = motion.y * (-0.1); 
	motion = move_and_slide(motion, Vector2(0,1));
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
