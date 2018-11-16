extends Node

signal player_died
signal player_win

func _ready():
	$Mark.connect("player_died", self, "_on_die")
	$Mark.connect("player_win", self, "_on_win")

func _on_spawn_soldiers_timer_timeout():
	var soldier = preload("res://common_assets/Enemies/soldier1.tscn").instance()
	soldier.position = $spawn_soldiers.global_position
	add_child(soldier)

func _on_die():
	emit_signal("player_died", self)

func _on_win():
	emit_signal("player_win", self)

func _on_viewport_resized():
	var viewport = get_node("/level1")
	var height = viewport.get_rect().size.y
	var width = viewport.get_rect().size.x

	# Set viewpoint to run at 1080px tall, but adjust width to match aspect ratio of screen
	viewport.set_size_override(true, Vector2(1080*width/height,1080))
	viewport.set_size_override_stretch(true)