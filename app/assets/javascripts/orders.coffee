# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#order_post_number").jpostal({
    postcode : [ "#order_post_number" ],
    address  : {
                  "#order_delivery_address" : "%3%4%5"
            }
  })