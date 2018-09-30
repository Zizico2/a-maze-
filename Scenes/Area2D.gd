extends Area2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		get_tree().paused = true;
		$Game_Over_Popup.show();