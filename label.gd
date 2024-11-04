extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Rock: %s　Paper: %s　Scissor: %s" % [$"..".rock_count, $"..".paper_count, $"..".scissor_count]
