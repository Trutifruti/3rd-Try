extends Air_State
class_name Falling

@export var coyote: Timer
@onready var coyote_is_active: bool = true

func enter():
	super.enter()
	coyote.start()
	
func exit():
	pass

func update(_delta: float):
	if subject.is_on_floor():
		transitioned.emit(self, 'idle')
	if Input.is_action_just_pressed('up'):
		if coyote_is_active:
			transitioned.emit(self, 'jump')

func physics_update(_delta: float):
	super.air_straif()

func _on_coyote_timeout():
	coyote_is_active = false
