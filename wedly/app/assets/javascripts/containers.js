$(document).ready(function() {
    $( "#draggable" ).draggable();
    $( "#droppable" ).droppable({
      drop: function() {
        alert( "dropped" );
        }
      })
  })
