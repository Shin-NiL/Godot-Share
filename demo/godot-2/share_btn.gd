extends Button

var share = null # our share singleton instance

func _ready():
	# initialize the share singleton if it exists
	if Globals.has_singleton("GodotShare"):
		share = Globals.get_singleton("GodotShare")


func _on_share_btn_pressed():
	# get the current viewport and schedule a capture
	var view_port = get_viewport()
	view_port.queue_screen_capture()
	
	# wait two frames for the capture be ready
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	# The file must be saved at user:// root
	var image_save_path = OS.get_data_dir() + "/tmp.png"
	
	# actually takes the caputure
	var capture = view_port.get_screen_capture()
	# saves the capture as user://tmp.png
	capture.save_png(image_save_path)
	
	# if share was found, use it
	if share != null:
		share.sharePic(image_save_path, "Image Sharing", "Sharing image with GodotShare", "It's a demo app for testing GodotShare. Do you like it?")
	
	
