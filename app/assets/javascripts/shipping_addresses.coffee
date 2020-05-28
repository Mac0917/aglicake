# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#shipping_address_post_number").jpostal({
    postcode : [ "#shipping_address_post_number" ],
    address  : {
                  "#shipping_address_delively_address" : "%3%4%5"
                  }
  })