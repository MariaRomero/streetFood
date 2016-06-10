jQuery ->
  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map $('#map')[0], {
        center: {lat: 33.795386, lng: -118.095436}
        zoom: 12
      }

      new google.maps.Marker({
        position: lat: stall.latitude, lng: stall.longitude
        map: map
        })

      new google.maps.Marker({
          position: lat: 33.795386, lng: -118.095436
          map: map
          })
