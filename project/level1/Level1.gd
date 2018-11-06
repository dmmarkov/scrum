extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_spawn_soliders_timer_timeout():
	var solider = preload("res://common_assets/Enemies/solider1.tscn").instance()
	solider.position = $spawn_soliders.global_position 
	add_child(solider) 
	
func die():
	get_parent().die(self)