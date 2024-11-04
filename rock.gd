extends Area2D

@export var DEFAULT_SPEED : int = 200

const NAME = "Rock"

var _speed = DEFAULT_SPEED
var direction = Vector2()

@onready var _initial_pos = position
@onready var paper = preload("res://paper.tscn")

func _ready():
	randomize()
	#direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _process(delta):
	_speed += delta * 2
	position += _speed * delta * direction


func spawn_paper():
	queue_free()
	var _paper = paper.instantiate()
	_paper.direction = direction
	_paper.position = position
	_paper.name = "Paper_" + str($"../..".paper_count)
	$"../../Papers".add_child(_paper)


func _on_area_entered(area):
	if area.name.find("Paper") != -1:
		var deg = rad_to_deg((area.position - position).angle())
		#print(deg)
		var callable = Callable(self, "spawn_paper")
		callable.call_deferred()
	elif area.name.find("Rock") != -1:
		var deg = rad_to_deg((area.position - position).angle())
		#print(deg)
