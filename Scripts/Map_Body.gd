extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const gravity = 10;
var gravity_multiplier = 1;
var motion = Vector2(0,0);
var rotation_force = 0;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	get_node("/root/world/Ball/Ball_Sprite").rotate(rotation_force);
	if test_move(global_transform, delta*motion):
		var y = motion.y * (-0.1) + gravity * gravity_multiplier;
		print("this");
		motion = move_and_slide(motion, Vector2(0,-1));
		motion.y = y;
		
	else:
		motion.y -= gravity * gravity_multiplier;
		motion = move_and_slide(motion, Vector2(0,-1));
		
	print(motion);
	if is_on_ceiling() or is_on_wall():
		motion -= motion*0.06;
		print(motion.length());
		
		if motion.x > 0:
			rotation_force = -motion.length()*0.0008;
		elif motion.x < 0:
			rotation_force = motion.length()*0.0008;
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
