  function hide(selectors) {
    return selectors.map(function(selector) {
      selector.slideUp();
    });
  }

$(document).on('change load', '#options', function() {
  var customEvent = $('#custom-event');
  var training = $('#training');
  var transfer = $('#transfer');
  var visit = $('#visit');
  var x = parseInt($('#options').val());
  console.log(x);
  switch(x) {
    case 1:
      $.when(hide(training, transfer, visit)).done(customEvent.slideDown());
      break;
    case 2:
      $.when(hide(customEvent, transfer, visit)).done(training.slideDown());
      break;
    case 3:
      $.when(hide(customEvent, training, visit)).done(transfer.slideDown());
      break;
    case 4:
      $.when(hide(customEvent, training, transfer)).done(visit.slideDown());
      break;
    default:
      hide(customEvent, training, transfer, visit);
  }
});

$(document).on('change load', '#training-other-checkbox', function() {
  if ( $("#training-other-checkbox").is(':checked')) {
    $('.event_training_other').slideDown();
  } else {
    $('.event_training_other').slideUp();
  }
});


$(document).on('change', '[name="dog_id"]', function() {
  var data = $(this).serializeArray();
  $.ajax({
    method: 'POST',
    url: '/events/transfer',
    data: data,
    dataType: 'script'
  });
});


