$(document).ready(function(){
  $('#edit_submit').click(function(){
    $('[name="month"]').val($('[name="month_select"]').prop('selectedIndex'));
    $('[name="title"]').val($('[name="title_select"]').val());
    $('[name="gender"]').val($('[name="gender_select"]').val());
    if($('[name="gender_select"]').val() == '男')
    {
          $('[name="gender"]').val("M");
    }
    else if($('[name="gender_select"]').val() == '女')
    {
      $('[name="gender"]').val("F");
    }

    if($('[name="title_select"]').val() == '先生')
    {
      $('[name="title"]').val('Mr.');
    }
    else if($('[name="title_select"]').val() == '太太')
    {
      $('[name="title"]').val('Mrs.');
    }
    else if($('[name="title_select"]').val() == '女士')
    {
      $('[name="title"]').val('Ms.');
    }
    else if($('[name="title_select"]').val() == '小姐')
    {
      $('[name="title"]').val('Miss');
    }


});


  if($(window).width() <= 768)
  {
    $('#type').val('mobile');
  }
  else
  {
    $('#type').val('desktop');
  }
  $.fn.digits = function(){
      return this.each(function(){
          $(this).text( $(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
      })
  }

  var count = 0;
  var totalStart = 0;
  $('#product_table > tbody  > tr').each(function()
  {
    var $item = $(this).closest("tr");
    var sum = parseFloat($item.find('td:nth-child(3)').find('input').val());
    $item.find('td:nth-child(2)').find('span').digits();

    $unitPrice = parseFloat( $item.find('td:nth-child(2)').find('input').val());

    $item.find('td:nth-child(4)').text($unitPrice * sum).digits();
    totalStart += $unitPrice * sum;

  });
  $('#total').text(totalStart).digits();


$('#product_table td #add_button').click(function(){
var $item = $(this).closest("tr");

$('#total').text($('#total').text().replace(/,/g, ''));
$item.find('td:nth-child(4)').text($item.find('td:nth-child(4)').text().replace(/,/g,''));
var sum = parseFloat($item.find('td:nth-child(3)').find('input').val());
sum += 1;
$item.find('td:nth-child(3)').find('input').val(sum);
$unitPrice = parseFloat( $item.find('td:nth-child(2)').find('input').val());
$item.find('td:nth-child(4)').text($unitPrice * sum).digits();
var total = parseFloat($('#total').text());
total += $unitPrice;
$('#total').text(total).digits();

count++;
});

$('#product_table td #sub_button').click(function(){
var $item = $(this).closest("tr");
var sum = parseFloat($item.find('td:nth-child(3)').find('input').val());
if(sum <= 0)
  return false;
$('#total').text($('#total').text().replace(/,/g, ''));
$item.find('td:nth-child(4)').text($item.find('td:nth-child(4)').text().replace(/,/g,''));
sum -= 1;
$item.find('td:nth-child(3)').find('input').val(sum);
var unitNum = $item.find('td:nth-child(2)').find('span').text().replace(/,/g,'');
$item.find('td:nth-child(4)').text($unitPrice * sum).digits();
var total = parseFloat($('#total').text());
total -= $unitPrice;
$('#total').text(total).digits();

count--;

});
//$('#cart').tooltip().off('focusout');
//$('#cart').tooltip().off('mouseover');
$('#addCart').click(function(){
var allZero = true;
if($(window).width() <= 768)
{
$('#type').val('mobile');
}
else
{
$('#type').val('desktop');
}

//	$('#cart').tooltip('show');
//	$('#cart').html(count);


$('#product_table > tbody  > tr').each(function()
{
parseInt($('#itemNumber').val(0));
var $item = $(this).closest("tr");
var sum = parseFloat($item.find('td:nth-child(3)').find('input').val());
if(sum != 0)
{
allZero = false;
parseInt($('#itemNumber').val(parseInt($('#itemNumber').val()) + 1));
}


});

if(allZero)
{
$('#error').css('display', 'block');
$('#error').text('No item is selcted');
return false;
}
if($('#member_select').val() == '')
{
$('#error').css('display', 'block');
$('#error').text('No member selected');
return false;
}

if($('#member_select').val() != '')
{
$('#bill_form').submit();
return true;
}



});



/*
$('#cart').mouseover(function(){
$('#cart').tooltip('hide');

});

$('#cart').focus(function(){
$('#cart').tooltip('hide');
});
*/


});
