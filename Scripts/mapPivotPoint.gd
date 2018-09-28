extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	position = get_viewport().get_visible_rect().size/2;
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func __process(delta):
