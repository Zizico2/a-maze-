extends Node2D

func _on_Pause_Button_pressed():
	get_tree().paused = true;
	$Pause_Popup.show();
	
	


func _on_Resume_pressed():
	$Pause_Popup.hide();
	get_tree().paused = false;


func _on_Settings_pressed():
	$Pause_Popup.hide();
	get_node("/root/world/Pause_Popup/Settings/Settings_Popup").show();
	
func _on_Back_pressed():
	get_node("/root/world/Pause_Popup/Settings/Settings_Popup").hide();
	$Pause_Popup.show();
	