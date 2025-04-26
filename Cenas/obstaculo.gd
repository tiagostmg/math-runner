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
	if Global.pontuacao == 500 and Global.fase==1:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		
	elif Global.pontuacao == 500 and Global.fase==2:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		
	elif Global.pontuacao == 500 and Global.fase==3:
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
	
	var questoesConjuntos = [
		{
			"pergunta": "Se A ⊆ B, isso significa que:",
			"opcoes": [
				"Todo elemento de A está em B.",
				"Todo elemento de B está em A.",
				"A e B são conjuntos disjuntos."
			],
			"resposta_correta": 0
		},
		{
			"pergunta": "Qual é a união dos conjuntos A = {1, 2} e B = {2, 3}?",
			"opcoes": [
				"{1, 2}",
				"{1, 2, 3}",
				"{2, 3}"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se A = {1, 2, 3} e B = {2, 3, 4}, qual é a interseção de A e B?",
			"opcoes": [
				"{1}",
				"{2, 3}",
				"{3, 4}"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "Qual das alternativas representa a união de dois conjuntos A={2,4} e B={1,4,5}?",
			"opcoes": [
				"{2,4,1}",
				"{1,2,4,5}",
				"{4}"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se A={1,2,3}, qual é o complemento de A considerando o universo U={1,2,3,4,5}",
			"opcoes": [
				"{4,5}",
				"{1,2,3}",
				"{3,4}"
			],
			"resposta_correta": 0
		},
		{
			"pergunta": "Se A={1,2,3} e B={3,4,5}, qual é a interseção de A e B?",
			"opcoes": [
				"{1,2}",
				"{3}",
				"{1,2,3,4,5}"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "Qual operação entre dois conjuntos resulta em um novo conjunto contendo apenas os elementos comuns entre os dois conjuntos?",
			"opcoes": [
				"União",
				"Interseção",
				"Complemento"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "Em qual conjunto numérico o número -2,5 está inserido?",
			"opcoes": [
				"Inteiros(Z)",
				"Naturais(N)",
				"Racionais(Q)"
			],
			"resposta_correta": 2
		},
		{
			"pergunta": "O número √2 pertence a quais conjuntos?",
			"opcoes": [
				"Racionais(Q)",
				"Irracionais(I)",
				"Inteiros(Z)"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "O conjunto ∅ (vazio) é subconjunto de quais conjuntos?",
			"opcoes": [
				"Apenas dos Naturais(N)",
				"De qualquer conjunto",
				"De nenhum conjunto"
			],
			"resposta_correta": 1
		},
		{
			"pergunta": "",
			"opcoes": [
				"",
				"",
				""
			],
			"resposta_correta": 0
		},
		{
			"pergunta": "",
			"opcoes": [
				"",
				"",
				""
			],
			"resposta_correta": 0
		}
	]

	var questoesPaPg = [
		{
			"pergunta": "Qual é a razão da PA 5, 8, 11, 14, …?",
			"opcoes": ["2", "3", "5"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Qual é o 5º termo da PA 2, 6, 10, 14, …?",
			"opcoes": ["18", "22", "26"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Em uma PA, a1 = 7 e r = -2. Qual é o 4º termo?",
			"opcoes": ["1", "3", "5"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Se o primeiro termo de uma PA é 3 e a razão é 4, qual é o 6º termo?",
			"opcoes": ["19", "23", "27"],
			"resposta_correta": 1
		},
		{
			"pergunta": "A sequência 10, 7, 4, 1, … é uma PA de razão:",
			"opcoes": ["-2", "-3", "-4"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Qual é a soma dos cinco primeiros termos da PA 1, 4, 7, 10, …?",
			"opcoes": ["25", "35", "45"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Em uma PA de razão 5, o 1º termo é 2. Qual é o 7º termo?",
			"opcoes": ["27", "32", "37"],
			"resposta_correta": 1
		},
		{
			"pergunta": "A diferença entre dois termos consecutivos de uma PA é chamada de:",
			"opcoes": ["Termo geral", "Razão", "Soma dos termos"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Em uma PA, se a1 = 0 e r = 6, qual é o 8º termo?",
			"opcoes": ["42", "48", "54"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Na PA 15, 12, 9, 6, …, qual é o valor da razão?",
			"opcoes": ["-2", "-3", "-6"],
			"resposta_correta": 1
		}
	]




	
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
