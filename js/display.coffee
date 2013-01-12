class window.Display
  constructor: (@app)->
    @canvas = $ "canvas"
    @ctx = @canvas[0].getContext '2d'
    @ctx.fillCircle = (x,y,r)->
      @beginPath()
      @arc x, y, r, 0, Math.PI * 2, false
      @closePath()
      @fill()
  
  setDimensions: (@width, @height)=>
    @canvas[0].width = @width
    @canvas[0].height = @height

  draw: =>
    @clear()
    for num in [1..@roundom(100)]
      @ctx.fillStyle = "rgba(255,235,215,#{Math.random()})"
      @ctx.fillCircle @roundom(@width), @roundom(@height), @roundom @width / 8

  clear: =>
    @ctx.fillStyle = "rgb(#{@randwith(100, 155)},#{@randwith(100, 155)},#{@randwith(100, 155)})"
    @ctx.fillRect 0, 0, @width, @height

  randwith: (int, modifier)=>
    @roundom(int) + modifier
  roundom: (int)->
    Math.ceil Math.random() * int

  print: =>
    @canvas[0].toDataURL()