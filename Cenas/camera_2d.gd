extends Camera2D
@onready var player = get_parent().get_node("Player") 


func _process(delta: float) -> void:
	position.y = player.position.y - 100
	

func _on_ready() -> void:
	pass
