extends Area2D

@export var DEFAULT_SPEED : int = 200

const NAME = "Scissor"

var _speed = DEFAULT_SPEED
var direction = Vector2()

@onready var _initial_pos = position
@onready var rock = preload("res://rock.tscn")

func _ready():
	randomize()
	#direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction

func spawn_rock():
	queue_free()
	var _rock = rock.instantiate()
	_rock.direction = direction
	_rock.position = position
	_rock.name = "Rock_" + str($"../..".rock_count)
	$"../../Rocks".add_child(_rock)


func _on_area_entered(area):
	if area.name.find("Rock") != -1:
		var rad = (area.position - position).angle()
		var deg = rad_to_deg(rad)
		
		var callable = Callable(self, "spawn_rock")
		callable.call_deferred()
	elif area.name.find("Scissor") != -1:
		var deg = rad_to_deg((area.position - position).angle())
		#print(deg)


