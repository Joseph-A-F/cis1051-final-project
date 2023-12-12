extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../../../CharacterBody2D2" != null:
		text = str($"../../../CharacterBody2D2".damage)
	else:
		text = ""
	pass
