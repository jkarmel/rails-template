window.BamPow.Tracking =
  init: () ->
    # Bind tracking callbacks
    $(".track_click").click (event) ->
      $elem = $(event.currentTarget)
      BamPow.Tracking.parse_and_track_click $elem

    # TODO: Track dynamically created elements (possibly via JQuery.on)

  parse_and_track_click: ($elem) ->
    data = JSON.parse $elem.attr('track_click_data')
    data.label = 'click'

    BamPow.Tracking.track_click data

  track_click: (data) ->
    ga_data = ['_trackEvent']

    ga_data.push(data.category) if data.category
    ga_data.push(data.action) if data.action
    ga_data.push(data.label) if data.label
    ga_data.push(data.value) if data.value

    _gaq.push ga_data

$(document).ready BamPow.Tracking.init
