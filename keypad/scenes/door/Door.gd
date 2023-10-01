extends Interactable

enum STATE {
	OPEN,
	CLOSED
}

var state = STATE.CLOSED
# onready var anim_player = $AnimationPlayer
@onready var anim_player = $AnimationPlayer

# interactable
func get_interaction_text():
	if state == STATE.OPEN:
		return "to close door"

	return ""

func interact():
	# return if door is in mid animation
	if anim_player.is_playing():
		return

	if state == STATE.OPEN:
		close()

# door
func open():
	# return if door is in mid animation
	if anim_player.is_playing():
		return
	if state == STATE.OPEN:
		return

	anim_player.play("door_open")

func close():
	# return if door is in mid animation
	if anim_player.is_playing():
		return
	if state == STATE.CLOSED:
		return
	anim_player.play_backwards("door_open")


func _on_AnimationPlayer_animation_finished(anim_name):
	if state == STATE.OPEN:
		state = STATE.CLOSED
	else:
		state = STATE.OPEN



func _on_plug_electricity_changed():
	pass # Replace with function body.
