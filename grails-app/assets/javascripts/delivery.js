var FormStuff = {

  init: function() {
    // kick it off once, in case the radio is already checked when the page loads
    this.applyConditionalRequired();
    this.bindUIActions();
  },

  bindUIActions: function() {
    // when a radio or checkbox changes value, click or otherwise
    $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
  },

  applyConditionalRequired: function() {
    // find each input that may be hidden or not
    $(".require-if-active").each(function() {
      var el = $(this);
      // find the pairing radio or checkbox
      if ($(el.data("require-pair")).is(":checked")) {
        // if its checked, the field should be required
        el.prop("required", true);
      } else {
        // otherwise it should not
        el.prop("required", false);
      }
    });
  }

};

FormStuff.init();

$(document).ready(function(){
  $('#en').attr('href', null);
  $('#zt').attr('href', null);
  $('#zs').attr('href', null);
  $('#en_mobile').attr('href', null);
  $('#zt_mobile').attr('href', null);
  $('#zs_mobile').attr('href', null);



  $('#en').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/en/opinion/medicalBill');
    $('#bill_form2').submit();
  });

  $('#zt').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zt/opinion/medicalBill');
    $('#bill_form2').submit();
  });
  $('#zs').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zs/opinion/medicalBill');
    $('#bill_form2').submit();
  });

  $('#en_mobile').click(function(){

    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/en/opinion/medicalBill');
    $('#bill_form2').submit();
  });

  $('#zt_mobile').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zt/opinion/medicalBill');
    $('#bill_form2').submit();
  });

  $('#zs_mobile').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zs/opinion/medicalBill');
    $('#bill_form2').submit();
  });


$('#submit_button').click(function(){
$('[name="back"]').val(1);

if($('input[name=choice_delivery]:checked', '#bill_form').val() == 1)
{
  $('[name="territory_name"]').prop('required', false);
  $('[name="link"]').prop('required', false);
    $('[name="phone"]').prop('required', false);
}
else if($('input[name=choice_delivery]:checked', '#bill_form').val() == 2)
{
  $('[name="link"]').prop('required', false);
}
else
{
  $('[name="territory_name"]').prop('required', false);
    $('[name="phone"]').prop('required', false);
}
});

$('#backButton').click(function(){

if(parseInt($('[name="back"]').val()) >= 2)
{
if($(window).width() < 768)
{
  parent.history.go(-1 - parseInt($('[name="back"]').val()));
}
else
{
  parent.history.go(0 - parseInt($('[name="back"]').val()));
}
}
else
{
  parent.history.back();
}

return false;
});

});
