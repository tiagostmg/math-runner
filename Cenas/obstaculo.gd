extends TileMapLayer

var areaCorreta = 0

const esquerda = 188 
const meio = 228 
const direita = 268 


func _ready() -> void:
	$"../Fundo Obstaculo".visible = true
	$".".visible = true
	$"../Camera2D/Label".visible = true
	$"../Camera2D/TextoRespostas".visible = true
	
	position.y -= (Global.espaco / 2)
	$"../Fundo Obstaculo".position.y -= (Global.espaco / 2)
	
	$Area1/Label1.text = "A"
	$Area2/Label2.text = "B"
	$Area3/Label3.text = "C"
	
	Global.pontuacao = 0
	Global.listaDeQuestoesJaFeitas = []

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
		$"../Camera2D/TextoRespostas".visible = false
		
	elif Global.pontuacao == 500 and Global.fase==2:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		$"../Camera2D/TextoRespostas".visible = false

		
	elif Global.pontuacao == 500 and Global.fase==3:
		$"../Linha Chegada".position.y = $".".position.y
		$".".visible = false
		$"../Fundo Obstaculo".visible = false
		$"../Camera2D/Label".visible = false
		$"../Camera2D/TextoRespostas".visible = false

func _mudarpos():

	sortear(Global.fase)
	var espaco = Global.espaco
	position.y -= espaco
	$"../Fundo Obstaculo".position.y -= espaco
func sortear(a):
	
	# a -> fase
	
	var questoesConjuntos = [
		{
			"pergunta": "Qual das alternativas representa a união de dois conjuntos A={2,4} e B={1,4,5}?",
			"opcoes": ["{1,2,4,5}", "{4}", "{2,4,1}"],
			"resposta_correta": 0
		},
		{
			"pergunta": "O conjunto ∅ (vazio) é subconjunto de quais conjuntos?",
			"opcoes": ["De qualquer conjunto", "Apenas dos Naturais(N)", "De nenhum conjunto"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Qual operação entre dois conjuntos resulta em um novo conjunto contendo apenas os elementos comuns entre os dois conjuntos?",
			"opcoes": ["Interseção", "União", "Complemento"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Em qual conjunto numérico o número -2,5 está inserido?",
			"opcoes": ["Racionais(Q)", "Inteiros(Z)", "Naturais(N)"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Qual é a união dos conjuntos A = {1, 2} e B = {2, 3}?",
			"opcoes": ["{2, 3}", "{1, 2, 3}", "{1, 2}"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se A ⊆ B, isso significa que:",
			"opcoes": ["Todo elemento de B está em A.", "Todo elemento de A está em B.", "A e B são conjuntos disjuntos."],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se A={1,2,3}, qual é o complemento de A considerando o universo U={1,2,3,4,5}",
			"opcoes": ["{1,2,3}", "{4,5}", "{3,4}"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se A = {1, 2, 3} e B = {2, 3, 4}, qual é a interseção de A e B?",
			"opcoes": ["{3, 4}", "{1}", "{2, 3}"],
			"resposta_correta": 2
		},
		{
			"pergunta": "O número √2 pertence a quais conjuntos?",
			"opcoes": ["Inteiros(Z)", "Racionais(Q)", "Irracionais(I)"],
			"resposta_correta": 2
		},
		{
			"pergunta": "Se A={1,2,3} e B={3,4,5}, qual é a interseção de A e B?",
			"opcoes": ["{1,2,3,4,5}", "{1,2}", "{3}"],
			"resposta_correta": 2
		}
	];
	
	var questoesPaPg = [
		{
			"pergunta": "Qual é a razão da PA 5, 8, 11, 14, …?",
			"opcoes": ["3", "2", "5"],
			"resposta_correta": 0
		},
		{
			"pergunta": "A diferença entre dois termos consecutivos de uma PA é chamada de:",
			"opcoes": ["Razão", "Soma dos termos", "Termo geral"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Na PA 15, 12, 9, 6, …, qual é o valor da razão?",
			"opcoes": ["-3", "-6", "-2"],
			"resposta_correta": 0
		},
		{
			"pergunta": "Em uma PA, se a1 = 0 e r = 6, qual é o 8º termo?",
			"opcoes": ["54", "48", "42"],
			"resposta_correta": 2
		},
		{
			"pergunta": "Qual é o 5º termo da PA 2, 6, 10, 14, …?",
			"opcoes": ["26", "18", "22"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Se o primeiro termo de uma PA é 3 e a razão é 4, qual é o 6º termo?",
			"opcoes": ["27", "23", "19"],
			"resposta_correta": 1
		},
		{
			"pergunta": "Qual é a soma dos quatro primeiros termos da PA 1, 4, 7, 10, …?",
			"opcoes": ["25", "22", "35"],
			"resposta_correta": 1
		},
		{
			"pergunta": "A sequência 10, 7, 4, 1, … é uma PA de razão:",
			"opcoes": ["-2", "-4", "-3"],
			"resposta_correta": 2
		},
		{
			"pergunta": "Em uma PA de razão 5, o 1º termo é 2. Qual é o 7º termo?",
			"opcoes": ["37", "27", "32"],
			"resposta_correta": 2
		},
		{
			"pergunta": "Em uma PA, a1 = 7 e r = -2. Qual é o 4º termo?",
			"opcoes": ["3", "5", "1"],
			"resposta_correta": 2
		}
	];


	match a: # fase
		1:
			var numSorteado = randi() % 10
			while Global.listaDeQuestoesJaFeitas.has(numSorteado):
				numSorteado = randi() % 10
			
			Global.listaDeQuestoesJaFeitas.append(numSorteado)
			
			var questaoAtual = questoesConjuntos[numSorteado]
			
			var opcoes = questaoAtual["opcoes"]
			var textoRespostas = "A- " + opcoes[0] + "\nB- " + opcoes[1] + "\nC- " + opcoes[2]
			
			$"../Camera2D/Label".text = (questaoAtual["pergunta"])
			$"../Camera2D/TextoRespostas".text = textoRespostas
			
			Global.areaCorreta = questaoAtual["resposta_correta"] + 1
			
			print("---")
			print(Global.areaCorreta)
			print("---")
		2:
			var numSorteado = randi() % 10
			while Global.listaDeQuestoesJaFeitas.has(numSorteado):
				numSorteado = randi() % 10
			
			Global.listaDeQuestoesJaFeitas.append(numSorteado)
			
			var questaoAtual = questoesPaPg[numSorteado]
			
			var opcoes = questaoAtual["opcoes"]
			var textoRespostas = "A- " + opcoes[0] + "\nB- " + opcoes[1] + "\nC- " + opcoes[2]
			
			$"../Camera2D/Label".text = (questaoAtual["pergunta"])
			$"../Camera2D/TextoRespostas".text = textoRespostas
			
			Global.areaCorreta = questaoAtual["resposta_correta"] + 1
			
			print("---")
			print(Global.areaCorreta)
			print("---")
		3:
			pass
