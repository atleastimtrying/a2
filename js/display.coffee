class window.Display
  constructor: (@app)->
    @canvas = $ "canvas"
    @ctx = @canvas[0].getContext '2d'
    @ctx.fillCircle = (x,y,r)->
      @beginPath()
      @arc x, y, r, 0, Math.PI * 2, false
      @closePath()
      @fill()
    @ctx.strokeCircle = (x,y,r)->
      @beginPath()
      @arc x, y, r, 0, 2 * Math.PI, false
      @stroke()
  
  setDimensions: (@width, @height)=>
    @canvas[0].width = @width
    @canvas[0].height = @height

  draw: =>
    @clear()
    @randomCircles()
    @randomCurves()
  
  wanderingCurve: =>
    startX = @roundom @width
    startY = @roundom @height
    endX = @roundom @width
    endY = @roundom @height
    diffX = endX - startX
    diffY = endY - startY
    @ctx.lineWidth = 1
    @ctx.strokeStyle = 'rgba(255,255,255,0.5)'
    @ctx.beginPath()
    @ctx.moveTo startX, startY
    @ctx.bezierCurveTo @randwith(diffX, startX), @randwith(diffY, startY), @randwith(diffY, endY * 0.7), @randwith(diffY, endY * 0.7), endX, endY
    @ctx.stroke()
    @ctx.strokeCircle endX, endY, 10
  
  randomCurves: =>
    @wanderingCurve() for num in [1..@roundom(10)]
  
  randomCircles: =>
    for num in [1..@roundom(100)]
      rgb = "#{@randwith(50, 205)},#{@randwith(50, 205)},#{@randwith(50, 205)}"
      x = @roundom @width
      y = @roundom @height
      r = @roundom @width / 16
      @ctx.lineWidth = @roundom(3)
      @ctx.fillStyle = "rgba(#{rgb},#{Math.random()})"
      @ctx.fillCircle x, y, r
      @ctx.strokeStyle = "rgb(#{rgb})"
      @ctx.strokeCircle x, y, @roundom r

  clear: =>
    @ctx.fillStyle = "rgb(#{@randwith(100, 105)},#{@randwith(100, 105)},#{@randwith(100, 105)})"
    @ctx.fillRect 0, 0, @width, @height

  randwith: (int, modifier)=>
    @roundom(int) + modifier
  
  roundom: (int)->
    Math.ceil Math.random() * int

  print: =>
    @canvas[0].toDataURL()