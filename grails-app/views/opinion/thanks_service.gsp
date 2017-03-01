Dear Customer,

Thanks for using from Taipan health

Your invoice no. is ${invoiceNo}. Please see the enclosed attachment for your reference.

The delivery method chosen: ${delivery_method}.

<g:if test = "${question != 'null'}">
Your Question: ${question}

</g:if>

<g:if test = "${delivery_method != 'Send by express mail'}">
<g:if test = "${delivery_method == 'Have us pick it up'}">Address: ${delivery_content}</g:if>
<g:elseif test = "${delivery_method == 'Access storage link'}">Link: ${delivery_content}</g:elseif>
</g:if>

Best,

Taipan Health
