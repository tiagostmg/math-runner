extends CharacterBody2D

@onready var animacao = $AnimatedSprite2D

var SPEED = 100
const esquerda = 188
const meio = 228
const direita = 268

var caminho = 1
var move_cooldown = 0.2
var cooldown_timer = 0.0 

var anim = Global.personagem

func _physics_process(delta: float) -> void:
	
	$"../Camera2D/Pontos".text = str(Global.pontuacao)
	
	match anim:
		1:
			animacao.play("p1")
		2:
			animacao.play("p2")
		3:
			animacao.play("p3")
		4:
			animacao.play("p4")

	
	cooldown_timer += delta
	
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction != 0 and cooldown_timer >= move_cooldown:
		
		if direction < 0 and caminho > 0:
			caminho -= 1
			cooldown_timer = 0.0  
		elif direction > 0 and caminho < 2:
			caminho += 1
			cooldown_timer = 0.0   
	
	if caminho == 1:
		position.x = move_toward(position.x, meio, SPEED * delta * 2)
	elif caminho == 0:
		position.x = move_toward(position.x, esquerda, SPEED * delta * 2)
	elif caminho == 2:
		position.x = move_toward(position.x, direita, SPEED * delta * 2)
	
	velocity.y = -SPEED * 3 / 4

	move_and_slide()
	

func acerto():
	Global.pontuacao += 100
	$"../Timer".start()
	
func erro():
	Global.coracao -= 1
	SPEED = 30
	$Timer.start()
	if Global.coracao == 2:
		$"../Camera2D/Coracao2".play("default")
	elif Global.coracao == 1:
		$"../Camera2D/Coracao1".play("default")
	elif Global.coracao == 0:
		get_tree().change_scene_to_file("res://Cenas/game_over.tscn")
	$"../Timer".start()
	

func _on_area_1_area_entered(area: Area2D) -> void:
	Global.areaAtual = 1
	if Global.areaAtual == Global.areaCorreta:
		acerto()
	else:
		erro()
	print(1)

func _on_area_2_area_entered(area: Area2D) -> void:
	Global.areaAtual = 2
	if Global.areaAtual == Global.areaCorreta:
		acerto()
	else:
		erro()
	print(2)

func _on_area_3_area_entered(area: Area2D) -> void:
	Global.areaAtual = 3
	if Global.areaAtual == Global.areaCorreta:
		acerto()
	else:
		erro()
	print(3)

func _on_area_linha_chegada_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Cenas/Vitoria.tscn")


func _on_timer_timeout() -> void:
	SPEED = 100
