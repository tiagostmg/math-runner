extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_buttonp_1_mouse_entered() -> void:
	$p1.play("frente")

func _on_buttonp_1_mouse_exited() -> void:
	$p1.stop()

func _on_buttonp_2_mouse_entered() -> void:
	$p2.play("frente")

func _on_buttonp_2_mouse_exited() -> void:
	$p2.stop()

func _on_buttonp_3_mouse_entered() -> void:
	$p3.play("frente")

func _on_buttonp_3_mouse_exited() -> void:
	$p3.stop()

func _on_buttonp_4_mouse_entered() -> void:
	$p4.play("frente")

func _on_buttonp_4_mouse_exited() -> void:
	$p4.stop()


func _on_buttonp_1_button_down() -> void:
	Global.personagem = 1
	get_tree().change_scene_to_file("res://Cenas/tela_inicio.tscn")


func _on_buttonp_2_button_down() -> void:
	Global.personagem = 2
	get_tree().change_scene_to_file("res://Cenas/tela_inicio.tscn")



func _on_buttonp_3_button_down() -> void:
	Global.personagem = 3
	get_tree().change_scene_to_file("res://Cenas/tela_inicio.tscn")


func _on_buttonp_4_button_down() -> void:
	Global.personagem = 4
	get_tree().change_scene_to_file("res://Cenas/tela_inicio.tscn")
