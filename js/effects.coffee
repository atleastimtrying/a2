class window.Effects
  constructor: ->
    $('.downloadable').live 'mouseover', @hover

  hover: (event)=>
    single = $ event.currentTarget
    $('.downloadable').addClass 'blurred'
    single.removeClass 'blurred'