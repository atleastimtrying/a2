class App
	constructor: ->
		@a1Width = 7016
		@a1Height = 9922
		@display = new Display @
		@effects = new Effects
		$("#make").click @make
		$(".close").live 'click', @remove
		$('#type').change @setType

	remove: ->
		$(@).parent('.downloadable').fadeOut ->
			$(@).remove()
		false

	setType: (event)=>
		@type = $(event.currentTarget).val()
		$('#digital, #print').hide()
		$("##{@type}").show()

	make: =>
		@calculateDimensions()
		@display.draw()
		$("article").append "<div class='downloadable'><a href='#' class='close'>x</a><a href='#{@display.print()}' target='_blank' class='download'><span><img src='#{@display.print()}' class='#{@orientation}'></span>Download</a><div>"
		false
	
	calculateDimensions: =>
		if @type is 'print'
			divisor = $('select#print').val()
			width = Math.round @a1Width / divisor
			height = Math.round @a1Height / divisor
		else
			string = $('select#digital').val()
			dimensions = string.split 'x'
			height = dimensions[0]
			width = dimensions[1]

		@orientation = $('select#orientation').val()

		if @orientation is 'landscape'
			@display.setDimensions height, width
		else
			@display.setDimensions width, height

$ ->
	window.app = new App