extends CharacterBody2D
class_name Mage

@export var max_move_speed : float = 200.0
@export var max_straif_speed : float = 50.0
@export var straif_acceleration: float = 0.5
@export var acceleration : float = 0.5
@export var deceleration : float = 100

@export var jump_height : float = 1
@export var jump_t2p : float = 0.5
@export var jump_t2d : float = 0.5

@onready var jump_veloctiy : float = ((2.0* jump_height) / jump_t2p)*-1.0
@onready var jump_gravity : float = ((-2.0* jump_height) / (jump_t2p*jump_t2p))*-1.0
@onready var fall_gravity : float = ((-2.0* jump_height) / (jump_t2d*jump_t2d))*-1.0

@onready var direction : Vector2 = Vector2.ZERO
@onready var input_x_direction : int = 0
@onready var gravity_center: Vector2 = Vector2(0,1).normalized()

func _physics_process(delta):
	get_input_direction()
	get_direciton()
	var gravity: Vector2 = get_gravity()
	if not is_on_floor():
		velocity += gravity * delta
	move_and_slide()

func get_input_direction():
	input_x_direction = Input.get_axis('left', 'right')

func get_direciton():
	direction.y = sign(velocity.y)
	direction.x = sign(velocity.x)
	
func get_gravity() -> Vector2:
	return jump_gravity*gravity_center if velocity.y < 0.0 else fall_gravity*gravity_center

func _on_accelerating_orbe_acceleration(acceleration_value):
	print('test')
	velocity.x += acceleration_value*velocity.x
	velocity.y += acceleration_value*velocity.y

