jQuery -> 
  $("#item_price_ex_vat").change ->
    ex = $("#item_price_ex_vat").val()
    inc = Math.round(ex*1.2*100)/100.0
    console.log("Ex VAT #{ex}")
    $("#item_price_inc_vat").val(inc)
  $("#item_price_inc_vat").change ->
    inc = $("#item_price_inc_vat").val()
    ex = Math.round(inc/1.2*100)/100.0
    console.log("Inc VAT #{inc}")
    $("#item_price_ex_vat").val(ex)

