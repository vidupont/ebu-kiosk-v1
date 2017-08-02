# Progress bar
progress.animate 
	width: 280
	x: 140 
	options: 
		curve: Bezier.easeInOut
		repeat: 2

# Fade in with delay		
Utils.delay 3, ->
	screenB.x = 0
	screenA.opacity = 0

	# Animate all text layers
	for row, index in list.children 
		position = row.y
		row.opacity = 0
		row.y += 80

		row.animate 
			opacity: 1
			y: position
			options: 
				time: 1.5
				curve: Spring(1)
				delay: 0.1 * index