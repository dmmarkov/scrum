extends Node

signal player_died
signal player_win

func _ready():
	$Mark.connect("player_died",self,"_on_die")
	$Mark.connect("player_win",self,"_on_win")

func _on_spawn_soliders_timer_timeout():
	var solider = preload("res://common_assets/Enemies/solider1.tscn").instance()
	solider.position = $spawn_soliders.global_position 
	add_child(solider) 
	
func _on_die():
	emit_signal("player_died", self)
	
func _on_win():
	emit_signal("player_win", self)