extends Area2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		get_tree().paused = true;
		get_node("/root/generic_level/Game_Over_Popup").show();