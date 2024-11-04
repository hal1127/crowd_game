extends Area2D

@export var DEFAULT_SPEED : int = 200

const NAME = "Paper"

var _speed = DEFAULT_SPEED
var direction = Vector2()

@onready var _initial_pos = position
@onready var scissor = preload("res://scissor.tscn")

func _ready():
	randomize()
	#direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()


func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction


func spawn_scissor():
	queue_free()
	var _scissor = scissor.instantiate()
	_scissor.direction = direction
	_scissor.position = position
	_scissor.name = "Scissor_" + str($"../..".scissor_count)
	$"../../Scissors".add_child(_scissor)


func _on_area_entered(area):
	if area.name.contains("Scissor"):
		var deg = rad_to_deg((area.position - position).angle())
		#print(deg)
		

		var callable = Callable(self, "spawn_scissor")
		callable.call_deferred()
	elif area.name.find("Paper") != -1:
		var deg = rad_to_deg((area.position - position).angle())
		#print(deg)
