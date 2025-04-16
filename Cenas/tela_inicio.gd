extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var anim = $Animacao
	match(Global.personagem):
		1:
			anim.play("p1")
		2:
			anim.play("p2")
		3:
			anim.play("p3")
		4:
			anim.play("p4")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jogar_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/Fases.tscn")


func _on_personagens_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/EscolhaPersonagem.tscn")


func _on_ajuda_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/Ajuda.tscn")


func _on_opcao_button_down() -> void:
	get_tree().change_scene_to_file("res://Cenas/Configuracoes.tscn")
