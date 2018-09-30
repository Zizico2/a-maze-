extends Node2D



func _on_Glass_pressed():
	get_tree().change_scene("res://Scenes/glass_world.tscn");



func _on_Scorched_Prison_pressed():
	get_tree().change_scene("res://Scenes/schorched_world.tscn");


func _on_Frosted_Prison_pressed():
	get_tree().change_scene("res://Scenes/frosted_world.tscn");


func _on_Forest_pressed():
	get_tree().change_scene("res://Scenes/forest_world.tscn");


func _on_Prison_pressed():
	print("this");
	get_tree().change_scene("res://Scenes/prison_world.tscn");
