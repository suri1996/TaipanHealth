<!doctype html>
<html>
	<head>
	    <meta name="layout" content="opinion_layout"/>
	    <title><g:message code="my.localized.footera" /> | <g:message code = "my.localized.about"/></title>
  </head>
  <body>
		<asset:stylesheet src="h.css"/>
    <div class="row container content">
      <form method="POST" action="handle_payment" id="adyen-encrypted-form">
        <div class = "row">
          <div class = "col-md-2">
        <label>Card number:</label></div>
          <input type="text" size="20" autocomplete="off" data-encrypted-name="number" />
        </div>
        <div class = "row">
        <div class = "col-md-2">
        <label>Horder name:</label></div>
          <input type="text" size="20" autocomplete="off" data-encrypted-name="holderName" />
        </div>
        <div class = "row">
        <div class = "col-md-2">
        <label>Expiry Month:</label></div>
          <input type="text" size="2" maxlength="2" autocomplete="off" data-encrypted-name="expiryMonth" />
        </div>
        <div class = "row">
        <div class = "col-md-2">
        <label>Expiry Year:</label></div>
          <input type="text" size="4" maxlength="4" autocomplete="off" data-encrypted-name="expiryYear" />
        </div>
        <div class = "row">
        <div class = "col-md-2">
        <label>CVC:</label></div>
          <input type="text" size="4" maxlength="4" autocomplete="off" data-encrypted-name="cvc" />
        </div>

          <input type="hidden" value="generate-this-server-side" data-encrypted-name="generationtime" />
          <div class = "row">

          <input type="submit" class = "btn btn-primary" value="Pay" /></div>
      </form>
		</div>

    <script type="text/javascript" src="https://test.adyen.com/hpp/cse/js/7514715866993403.shtml"></script>
    <script type="text/javascript">
    // the form element to encrypt
    var form    = document.getElementById('adyen-encrypted-form');
    // See adyen.encrypt.simple.html for details on the options to use
    var options = {};

    // Create the form.
    // Note that the method is on the Adyen object, not the adyen.encrypt object.
    adyen.createEncryptedForm( form, options);
    </script>
  </body>
</html>
