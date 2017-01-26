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

      select: function(start, end) {
        $.getScript('/events/new', function() {
          var startDate = moment(start).format("YYYY-MM-DD HH:mm");
          var endDate = moment(end).format("YYYY-MM-DD HH:mm");
          $('input#startTime').datetimepicker({
            defaultDate: startDate 
          });
          $('input#endTime').datetimepicker({
            defaultDate: endDate 
          });
          $('#startTime').val(moment(start).format("YYYY-MM-DD HH:mm"));
          $('#endTime').val(moment(end).format("YYYY-MM-DD HH:mm"));
        });

        calendar.fullCalendar('unselect');
      }
    });
  });
};
$(document).on('turbolinks:load', initialize_calendar);
