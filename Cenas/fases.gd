extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fase_1_button_down() -> void:
	Global.fase = 1
	get_tree().change_scene_to_file("res://Cenas/Main.tscn")


func _on_fase_2_button_down() -> void:
	Global.fase = 2
	get_tree().change_scene_to_file("res://Cenas/Main.tscn")


func _on_fase_3_button_down() -> void:
	Global.fase = 3
	get_tree().change_scene_to_file("res://Cenas/Main.tscn")
