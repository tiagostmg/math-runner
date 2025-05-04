extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pos botao1.x = 167
	#pos2 botao1.x = 2
	#pos botaoProxFase.x = 130
	
	if Global.fase == 1:
		$Button.position.x = 2
		$proxFase.position.x = 130
		$proxFase.visible = true
	else:
		$Button.position.x = 167
		$proxFase.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/tela_inicio.tscn")

func _on_prox_fase_button_down() -> void:
	Global.fase += 1
	get_tree().change_scene_to_file("res://Cenas/Main.tscn")
	
