extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const gravity = 10;
var gravity_multiplier = 1;
var motion = Vector2(0,0);
var rotation_force = 0;

var friction = 0.047;


#do not change
var sprite_rotation_speed = friction/friction_ratio;
#do not change
const friction_ratio = 75; #friction/sprite_rotation_speed



func _ready():
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	
	get_node("/root/generic_level/Ball/Ball_Sprite").rotate(rotation_force);
	if test_move(global_transform, delta*motion):
		var y = motion.y * (-0.225) + gravity * gravity_multiplier;
		var x = motion.x;
		motion = move_and_slide(motion, Vector2(0,10));
		if is_on_wall():
			motion.x = -x;	
		if is_on_floor():
			motion.y = y;
		
		
	else:
		motion.y -= gravity * gravity_multiplier;
		motion = move_and_slide(motion, Vector2(0,10));
	
	if motion.length() == 0:
		rotation_force = 0;
	elif is_on_floor() or is_on_wall():
		motion -= motion*friction;
		if motion.x > 0:
			rotation_force = -motion.length()*sprite_rotation_speed;
		elif motion.x < 0:
			rotation_force = motion.length()*sprite_rotation_speed;
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
