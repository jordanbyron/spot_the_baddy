function enableEdit(){
  $('#time_entries .row:not(.edit)').live('dblclick', function(e){
    $(e.currentTarget).addClass('edit').find('.nubbin').addClass('edit');
    $('#loading').show();
    
    
    var id = $(e.currentTarget).attr('id').replace(/time_entry_/, '');
    $.get('/time_entries/' + id + '/edit');
  });
}

function enableNubbins(){
  $('#time_entries .row').live('mouseover', function(e){
    $('.nubbin:not(.edit)').each(function(id, nub){
      $(nub).hide();
		});

    $(e.currentTarget).find('.nubbin').show();
    
  });
	
  $('#time_entries').mouseout(function(){
    $('.nubbin:not(.edit)').each(function(id, nub){
      $(nub).hide();
		});
	});
}

function updateTotalHours(change){
  var totalHours = 0.0;
  
  $('.time_entry .hours').each(function(id, data){
    if($(data).text().length > 0)
      totalHours += parseFloat($(data).text());
  });
  
  totalHours = Math.round(totalHours*100)/100
  $("#total_hours").text(totalHours);
}