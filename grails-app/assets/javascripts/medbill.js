$(document).ready(function(){
  var isSubmitted = false;
  $('#en').attr('href', null);
  $('#zt').attr('href', null);
  $('#zs').attr('href', null);
  $('#en_mobile').attr('href', null);
  $('#zt_mobile').attr('href', null);
  $('#zs_mobile').attr('href', null);
  $('#en').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);

    $('#bill_form2').attr('action', '/en/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });

  $('#zt').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zt/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });
  $('#zs').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zs/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });
  $('#en_mobile').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/en/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });

  $('#zt_mobile').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zt/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });
  $('#zs_mobile').click(function(){
    $('[name="back"]').val(parseInt($('[name="back"]').val()) + 1);
    $('#bill_form2').attr('action', '/zs/opinion/medicalBill_summary');
    $('#bill_form2').submit();
  });

  $('#invoice_form').submit(function(){
    if(!isSubmitted)
    {
      isSubmitted = true;
      return true;
    }
      return false;
  });


  $('#backButton').click(function(){

    if(parseInt($('[name="back"]').val()) >= 2)
    {

      parent.history.go(0 - parseInt($('[name="back"]').val()));
    }
    else
    {
        parent.history.back();
    }
    return false;
  });


});
