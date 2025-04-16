extends TileMapLayer

var areaCorreta = 0

const esquerda = 188 
const meio = 228 
const direita = 268 


func _ready() -> void:
	$"../Fundo Obstaculo".visible = true
	$".".visible = true
	$"../Camera2D/Label".visible = true
	Global.pontuacao = 0

	Global.coracao = 3
	match Global.fase:
		1:
			$"../Fundo".visible = true
			$"../Estrada".visible = true
			$"../Fundo2".visible = false
			$"../Estrada2".visible = false
			$"../Fundo3".visible = false
			$"../Estrada3".visible = false
		2:
			$"../Fundo".visible = false
			$"../Estrada".visible = false
			$"../Fundo2".visible = true
			$"../Estrada2".visible = true
			$"../Fundo3".visible = false
			$"../Estrada3".visible = false
		3:
			$"../Fundo".visible = false
			$"../Estrada".visible = false
			$"../Fundo2".visible = false
			$"../Estrada2".visible = false
			$"../Fundo3".visible = true
			$"../Estrada3".visible = true
	sortear(Global.fase)

func _on_timer_timeout() -> void:
	_mudarpos()
	if Global.pontuacao == 1000 and Global.fase==1:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		
	elif Global.pontuacao == 1000 and Global.fase==2:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		
	elif Global.pontuacao == 1000 and Global.fase==3:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false

func _mudarpos():

	sortear(Global.fase)
	var espaco = Global.espaco
	position.y -= espaco
	$"../Fundo Obstaculo".position.y -= espaco
func sortear(a):
	
	# a -> fase
	
	var num1 = 0
	var num2 = 0
	var num3 = 0
	var Resposta = 0
	
	match a:
		1:
			num1 = (randi() % 10) + 1
			num2 = (randi() % 10) + 1
			Resposta = num1 + num2
			
			$"../Camera2D/Label".text = str(num1, " + ", num2)
		3:
			
			num1 = (randi() % 6) + 1
			num2 = (randi() % 6) + 1
			num3 = (randi() % 6) + 1
			
			var op = randi() % 3
			
			match op:
				0:
					$"../Camera2D/Label".text = str(num1, " + ", num2, " + ", num3)
					Resposta = num1 + num2 + num3

				1:
					if num1 >= num2:
						$"../Camera2D/Label".text = str(num1, " - ", num2, " + ", num3)
					else:
						num1 = num2 + 3
						$"../Camera2D/Label".text = str(num1, " - ", num2, " + ", num3)
					
					Resposta = num1 - num2 + num3

				2:
					if num1 + num2 >= num3:
						$"../Camera2D/Label".text = str(num1, " + ", num2, " - ", num3)
					else:
						num1 = num3 + 2
						$"../Camera2D/Label".text = str(num1, " + ", num2, " - ", num3)
					Resposta = num1 + num2 - num3
		2:
			var op = randi() % 2
			
			match op:
				0:
					num1 = (randi() % 6) + 1
					num2 = (randi() % 2) + 2
					$"../Camera2D/Label".text = str(num1, " × ", num2)
					Resposta = num1 * num2
				1:
					num2 = (randi() % 3) + 1
					num1 = num2 * ((randi() % 5) + 1)
					$"../Camera2D/Label".text = str(num1, " ÷ ", num2)
					Resposta = num1 / num2
					
	var s = randi() % 3
	var k = randi() % 3
	
	match s:
		0:
			#area1 certa
			$Area1/Label1.text = str(Resposta)
			if k != 0:
				$Area2/Label2.text = str(Resposta + k + 1)
				$Area3/Label3.text = str(Resposta + k)
			else:
				$Area2/Label2.text = str(Resposta + 2)
				$Area3/Label3.text = str(Resposta + 1)
				
		1:
			#area2 certa
			$Area2/Label2.text = str(Resposta)
			if k != 0:
				$Area1/Label1.text = str(Resposta + k + 1)
				$Area3/Label3.text = str(Resposta - k)
			else:
				$Area1/Label1.text = str(Resposta - 1)
				$Area3/Label3.text = str(Resposta + 1)
				
		2:
			#area3 certa
			$Area3/Label3.text = str(Resposta)
			if k != 0:
				$Area1/Label1.text = str(Resposta + k + 1)
				$Area2/Label2.text = str(Resposta - k)
			else:
				$Area1/Label1.text = str(Resposta + 2)
				$Area2/Label2.text = str(Resposta - 1)
		
	Global.areaCorreta = s + 1 #area correta
