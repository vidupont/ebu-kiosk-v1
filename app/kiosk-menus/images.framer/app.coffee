# Image Gallery
# by Kenny Chen
# prototypingwithframer.com/image-gallery-prototype

# This imports all the layers for "ImageScroll" into sketch
sketch = Framer.Importer.load "imported/ImageScroll"

# Create scroll component from content group
scroll = ScrollComponent.wrap sketch.content

# Add padding to bottom for tab bar
scroll.contentInset = {
	bottom: sketch.tabBar.height
}

# Only scroll vertically
scroll.scrollHorizontal = false

# Do not allow sublayer to pass events to superlayer
scroll.propagateEvents = false

# Store images within array
images = [
	sketch.img1
	sketch.img2
	sketch.img3
	sketch.img4
	sketch.img5
	sketch.img6
	sketch.img7
	sketch.img8
	sketch.img9
	sketch.img10
	sketch.img11
	sketch.img12
	sketch.img13
	sketch.img14
	sketch.img15
	sketch.img16
	sketch.img17
	sketch.img18
	sketch.img19
	sketch.img20	
]

# Store elements to show and hide
content = [
	scroll
	sketch.navBar
	sketch.tabBar
]

# Here we make sure the same logic applies to all imported images
for image in images
	
	# On Click
	image.on Events.Click, (event, layer) ->
		
		# Unless we're scrolling
		if not scroll.isMoving
		
			# Copy the current image
			currentImage = layer.copy()
			currentImage.placeBehind sketch.navBar
			currentImage.frame = layer.screenFrame
			layer.visible = false
			
 			# Ignore events and show the image
			image.ignoreEvents = true for image in images
			
			# Animate the image
			currentImage.animate
				properties:
					scale: Screen.width / currentImage.width
					midY: Screen.height / 2
					midX: Screen.width / 2
				curve: "spring(240,20,0)"
			
			# Hide elements
			for layerToHide in content
				layerToHide.animate
					properties:
						opacity: 0
					time: 0.2
			
			# Return to the default view
			currentImage.on Events.Click, ->
				this.animate
					properties:
						scale: 1
						x: layer.screenFrame.x
						y: layer.screenFrame.y
					time: 0.3
					
				# Remove image copy	
				this.on Events.AnimationEnd, ->
					layer.visible = true
					currentImage.destroy()
				
				# Show elements
				for layerToShow in content
					layerToShow.animate
						properties:
							opacity: 1
						time: 0.2
				
				# Remove the ignoreEvents property
				image.ignoreEvents = false for image in images	
