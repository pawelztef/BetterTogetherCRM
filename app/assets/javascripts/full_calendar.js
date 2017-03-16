var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function() {
    var calendar = $(this);
    calendar.fullCalendar({
     
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',
      timeFormat: 'HH:mm',

      select: function(start, end) {
        $.getScript('/events/new', function() {
          var startDate = moment(start).format("YYYY-MM-DD HH:mm");
          var endDate = moment(end).format("YYYY-MM-DD HH:mm");
          $('input#startTime').datetimepicker({
            defaultDate: startDate,
            format: 'YYYY-MM-DD HH:mm'
          });
          $('input#endTime').datetimepicker({
            defaultDate: endDate,
            format: 'YYYY-MM-DD HH:mm'
          });
          $('#startTime').val(moment(start).format("YYYY-MM-DD HH:mm"));
          $('#endTime').val(moment(end).format("YYYY-MM-DD HH:mm"));
        });

        calendar.fullCalendar('unselect');
      },


     eventDrop: function(event, delta, revertFunc) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {
          var startDate = moment(event.start).format("YYYY-MM-DD HH:mm");
          var endDate = moment(event.end).format("YYYY-MM-DD HH:mm");
          $('input#startTime').datetimepicker({
            defaultDate: startDate,
            format: 'YYYY-MM-DD HH:mm'
          });
          $('input#endTime').datetimepicker({
            defaultDate: endDate, 
            format: 'YYYY-MM-DD HH:mm'
          });
          $('#startTime').val(moment(event.start).format("YYYY-MM-DD HH:mm"));
          $('#endTime').val(moment(event.end).format("YYYY-MM-DD HH:mm"));
        });
      },

    });
  });
};
$(document).on('turbolinks:load', initialize_calendar);
