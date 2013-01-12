class Effects
	constructor: ->
		$('.downloadable').live 'mouseover', @hover

	hover: (event)=>
		single = $ event.currentTarget
		$('.downloadable').addClass 'blurred'
		single.removeClass 'blurred'

class Display
	constructor: (@app)->
		@canvas = $ "canvas"
		@ctx = @canvas[0].getContext '2d'
		@ctx.fillCircle = (x,y,r)->
      @beginPath()
      @arc x, y, r, 0, Math.PI * 2, false
      @closePath()
      @fill()
		@amount = @roundom 100
	
	setDimensions: (@width, @height)=>
		@canvas[0].width = @width
		@canvas[0].height = @height

	draw: =>
		@clear()
		for num in [1..@amount]
			@ctx.fillStyle = "rgba(2555,235,215,#{Math.random()})"
			@ctx.fillCircle @roundom(@width), @roundom(@height), @roundom @width / 8

	clear: =>
		@ctx.fillStyle = "rgb(#{@roundom(200)},#{@roundom(200)},#{@roundom(200)})"
		@ctx.fillRect 0, 0, @width, @height

	roundom: (int)->
		Math.ceil Math.random() * int

	print: =>
		@canvas[0].toDataURL() 

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
		$("body").append "<div class='downloadable'><a href='#' class='close'>x</a><a href='#{@display.print()}' target='_blank' class='download'><img src='#{@display.print()}' class='#{@orientation}'>Download</a><div>"
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