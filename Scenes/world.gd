extends Node2D

func _on_Pause_Button_pressed():
	get_tree().paused = true;
	$Pause_Popup.show();
	
	


func _on_Resume_pressed():
	$Pause_Popup.hide();
	get_tree().paused = false;


func _on_Settings_pressed():
	$Pause_Popup.hide();
	get_node("/root/generic_level/Pause_Popup/Settings/Settings_Popup").show();
	

	

func _on_Quit_pressed():
	get_tree().paused = false;
	get_tree().change_scene("res://Scenes/prison_world.tscn")
	$Game_Over_Popup.hide();

func _on_Back_pressed():
	get_node("/root/generic_level/Pause_Popup/Settings/Settings_Popup").hide();
	$Pause_Popup.show();


func _on_Replay_pressed():
	get_tree().paused = false;
	get_tree().reload_current_scene();


func _on_Victory_area_entered(area):
	if area.is_in_group("ball"):
		get_tree().paused = true;
		get_node("/root/generic_level/Game_Over_Popup").show();
