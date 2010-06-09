var time = 30;
var thisIsTheBaddie;

function countdown(){
  time -= 1;
  
  if(time < 0) return;
  
  $("#countdown").text(time);
  
  if(time == 0){
    window.location = "/is_baddie/null?baddy_id=" + thisIsTheBaddie.id;
    $("#hint").text("Too Late!!!!");
  }
  else if(time == 20){
    occurred_at = new Date(thisIsTheBaddie.occurred_at);
    
    var curr_min = occurred_at.getMinutes();

    curr_min = curr_min + "";

    if (curr_min.length == 1) curr_min = "0" + curr_min;
    
    $("#hint").text("Hint: The crime occurred on " + occurred_at.toDateString() + 
                    " at " + occurred_at.getHours() + ":" + curr_min);
  }
  else if(time == 10){
    $("#hint").text("Hint: It was " + thisIsTheBaddie.baddygory);
  }
  else if(time == 5)
    $("#hint").text("Hurry Up!");
}