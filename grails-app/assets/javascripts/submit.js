$(document).ready(function(){
  var isSubmitted = false;
    $('#sendMessage').submit(function(){
      if(!isSubmitted)
      {
        isSubmitted = true;
        return true;
      }
        return false;

    });
});
