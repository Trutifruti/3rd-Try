extends State
class_name Idle

@export var landingjump: Timer

func enter():
	if not landingjump.is_stopped():
		transitioned.emit('jumping')
	pass
	
func exit():
	pass

func update(_delta: float):
	if not landingjump.is_stopped():
		transitioned.emit('jump') 
	if Input.is_action_just_pressed('up'):
		transitioned.emit(self, 'jumping')
	if subject.input_x_direction != 0:
		transitioned.emit(self, 'running')
	if not subject.is_on_floor():
		transitioned.emit(self, 'falling')

func physics_update(_delta: float):
	if subject.velocity.x != 0:
		subject.velocity.x = lerp(subject.velocity.x, 0, 0.5)
