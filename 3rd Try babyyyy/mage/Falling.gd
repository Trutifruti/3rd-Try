extends State
class_name Falling

@export var coyote: Timer
@export var landingjump: Timer

func enter():
	coyote.start()
	
func exit():
	pass

func update(_delta: float):
	if subject.is_on_floor():
		transitioned.emit('idle')
	if Input.is_action_just_pressed('up'):
		if not coyote.is_stopped():
			transitioned.emit('jump')
		else:
			landingjump.start()
	
func physics_update(_delta: float):
	pass
