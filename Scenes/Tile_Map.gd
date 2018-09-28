extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var shape;
var collision;
const tileSize = Vector2(16,16);
var usedCells;

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	shape = RectangleShape2D.new();
	shape.set_extents(tileSize);
	usedCells = get_used_cells();
	

func _physics_process(delta):
	var parentNode = get_node("/root/world/Map_Pivot_Point/Map_Body");
	for cell in usedCells:
		var collision = CollisionShape2D.new();
		collision.set_shape(shape);
		collision.position = cell*32 + Vector2(16,16);
		parentNode.add_child(collision);
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
