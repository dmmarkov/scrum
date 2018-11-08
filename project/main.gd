extends Node

var level1 = preload("res://level1/Level1.tscn");
var die = preload("res://common_assets/GUI/die/die.tscn");
var win = preload("res://common_assets/GUI/win/win.tscn");

func _ready():
	var menu = load("res://common_assets/GUI/menu/Menu.tscn").instance()
	menu.connect("open_level",self,"_on_open_level")
	add_child(menu)
		
func _on_open_level(level, menu):
	menu.queue_free()
	var current_level = level1.instance()
	current_level.connect("player_died",self,"_on_player_died")
	current_level.connect("player_win",self,"_on_player_win")
	get_parent().add_child(current_level)
	
#####################################################
func _on_player_died(level):
	level.queue_free()
	var current_die = die.instance()
	current_die.connect("closed_die_menu",self,"_on_closed_die_menu")
	get_parent().add_child(current_die)	

func _on_player_win(level):
	level.queue_free()
	var current_win = win.instance()
	current_win.connect("closed_win_menu",self,"_on_closed_win_menu")
	get_parent().add_child(current_win)
	
######################################################
func _on_closed_die_menu(die_menu):
	die_menu.queue_free()
	var menu = load("res://common_assets/GUI/menu/Menu.tscn").instance()
	menu.connect("open_level",self,"_on_open_level")
	add_child(menu)	
	
func _on_closed_win_menu(win_menu):
	win_menu.queue_free()
	var menu = load("res://common_assets/GUI/menu/Menu.tscn").instance()
	menu.connect("open_level",self,"_on_open_level")
	add_child(menu)	