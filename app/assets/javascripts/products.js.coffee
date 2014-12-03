# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

loadComponents = ->
	$(document).on('opened.fndtn.reveal', '[data-reveal]', ->
		modal = $(this)

	)

	

	$('.btn-order').on('click', ->
		id = $(this).data('samuel-id')
		quiero = $('#' + id).text()
		price = $('#precio' + id).text()
		$("#order_Product_id").val(id)
		$('#texto').text(quiero)
		$('#precio').text(price)
		$('#myModal').foundation('reveal', 'open')
		)


$("#new_order").on "keyup keypress", (e) ->
  code = e.keyCode or e.which
  if code is 13
    e.preventDefault()
    false


onAddTag = (tag) ->
  arreglo=$("#Intentemos").val().split(",")
  arreglo.remove(tag)
  arreglo.push(tag)
  arreglo.remove("")
  $("#Intentemos").val(arreglo)
  return

onRemoveTag = (tag) ->
  arreglo=$("#Intentemos").val().split(",")
  arreglo.remove(tag)
  $("#Intentemos").val(arreglo)
  return
	

$(document).ready ->
	loadComponents()

$(document).on('page:load', ->
	loadComponents();
$("#prueba").tagsInput
  width: "100%"
  height: "40px"
  defaultText: ""
  onAddTag: onAddTag
  onRemoveTag: onRemoveTag		
  )

Array::remove = ->
  what = undefined
  a = arguments
  L = a.length
  ax = undefined
  while L and @length
    what = a[--L]
    @splice ax, 1  while (ax = @indexOf(what)) isnt -1
  this

