extends Node2D

func _on_Start_Game_pressed():
	get_tree().change_scene("res://Scenes/world_selecter.tscn");

func _on_Settings_pressed():
		get_tree().paused = true;
		get_node("/root/start_menu/Settings/Settings_Popup").show();
	

func _on_Back_pressed():
	get_node("/root/start_menu/Settings/Settings_Popup").hide();
	get_tree().paused = false;