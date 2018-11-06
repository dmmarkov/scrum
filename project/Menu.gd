extends MarginContainer

var current_level=1

func _on_StartButton_pressed():
	pass
	
func die(level):	
	level.queue_free()
	self.visible = true

func _on_StartButton_button_up():
	self.visible = false
	var level1 = preload("res://level1/Level1.tscn").instance()
	get_parent().add_child(level1)
