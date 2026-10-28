extends SceneTree
## Starter check only. Add gameplay checks as you implement the practicum.
## godot --headless --path . -s tests/smoke_test.gd


func _initialize() -> void:
	_run.call_deferred()


func _run() -> void:
	var result: Error = change_scene_to_file("res://scenes/main.tscn")
	if result != OK:
		push_error("Starter scene could not be loaded.")
		quit(1)
		return
	await process_frame
	if current_scene == null or not current_scene.get_node_or_null("Camera") is Camera2D:
		push_error("Starter scene needs a Camera2D named Camera.")
		quit(1)
		return
	print("OK: starter scene loaded. Gameplay checks are still TODO.")
	quit(0)
