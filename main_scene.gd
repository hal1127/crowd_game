extends Node2D


const SPAWN_INTERVAL = 5

var rock_count = 0
var paper_count = 0
var scissor_count = 0


var initial_spawn = true
var initial_spawn_count = {"Rock": 0, "Paper": 0, "Scissor": 0}
var counter = 0

@onready var rock = preload("res://rock.tscn")
@onready var paper = preload("res://paper.tscn")
@onready var scissor = preload("res://scissor.tscn")


func refresh_count():
	rock_count = $Rocks.get_children().size()
	paper_count = $Papers.get_children().size()
	scissor_count = $Scissors.get_children().size()


func spawn(cell, name, pos):
	if counter % SPAWN_INTERVAL != 0:
			return
	var _cell = cell.instantiate()
	if name == "Rock":
		_cell.name = name + "_" + str(rock_count)
		var rad = deg_to_rad(rock_count * 10)
		_cell.direction = Vector2(cos(rad), sin(rad))
	elif name == "Paper":
		_cell.name = name + "_" + str(paper_count)
		var rad = deg_to_rad(paper_count * 10)
		_cell.direction = Vector2(cos(rad), sin(rad))
	elif name == "Scissor":
		_cell.name = name + "_" + str(scissor_count)
		var rad = deg_to_rad(scissor_count * 10)
		_cell.direction = Vector2(cos(rad), sin(rad))
	_cell.position = pos
	if name == "Rock":
		$Rocks.add_child(_cell)
	elif name == "Paper":
		$Papers.add_child(_cell)
	elif name == "Scissor":
		$Scissors.add_child(_cell)
	refresh_count()


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += 1
	
	if initial_spawn_count["Rock"] < 30:
		spawn(rock, "Rock", $RockSpawnPos.position)
		if counter % SPAWN_INTERVAL == 0:
			initial_spawn_count["Rock"] += 1
	if initial_spawn_count["Paper"] < 30:
		spawn(paper, "Paper", $PaperSpawnPos.position)
		if counter % SPAWN_INTERVAL == 0:
			initial_spawn_count["Paper"] += 1
	if initial_spawn_count["Scissor"] < 30:
		spawn(scissor, "Scissor", $ScissorSpawnPos.position)
		if counter % SPAWN_INTERVAL == 0:
			initial_spawn_count["Scissor"] += 1
	refresh_count()
