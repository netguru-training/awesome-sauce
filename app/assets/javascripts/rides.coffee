$ ->
  $("input#ride_start_city").geocomplete(
   details: "form .start"
   detailsAttribute: "data-geo"
  )
  $("input#ride_destination_city").geocomplete(
   details: "form .destination"
   detailsAttribute: "data-geo"
  )

  data = [
    {
      lat: parseFloat($('.ride__hidden-destination_city_lat').text())
      lon: parseFloat($('.ride__hidden-destination_city_lng').text())
      zoom: 8
      icon: "http://www.google.com/mapfiles/markerA.png"
    },
    {
      lat: parseFloat($('.ride__hidden-start_city_lat').text())
      lon: parseFloat($('.ride__hidden-start_city_lng').text())
      show_infowindow: false
    }
   ]

  new Maplace(
    locations: data
    map_div: "#gmap-route"
    generate_controls: false
    show_markers: true
    type: "directions"
    draggable: false
    afterRoute: (distance) ->
      $("#km").text ": " + (distance / 1000) + "km"
  ).Load()

  $('#datetimepicker1').datetimepicker(language: 'pt-BR')
