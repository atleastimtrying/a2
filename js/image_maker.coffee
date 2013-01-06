class App
	constructor: ->
		@canvas = $ "canvas"
		@ctx = @canvas[0].getContext '2d'
		@ctx.fillCircle = (x,y,r)->
      @beginPath()
      @arc x, y, r, 0, Math.PI * 2, false
      @closePath()
      @fill()
		@width = 3508
		@height = 4961
		@amount = @roundom 100
		@canvas[0].width = @width
		@canvas[0].height = @height
		@ctx.fillStyle = '#ededde'
		@ctx.fillRect 0, 0, @width, @height
		$("#go").click @go
	roundom: (int)->
		Math.ceil Math.random() * int
	go: =>
		for num in [1..@amount]
			@ctx.fillStyle = "rgba(200,175,165,#{Math.random()})"
			@ctx.fillCircle @roundom(@width), @roundom(@height), @roundom @width / 8
		$("body").append "<a href='" + @canvas[0].toDataURL() + "' target='_blank'> A2 -> download</a>"
		false

$ ->
	window.app = new App