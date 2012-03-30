jQuery -> 
  $("#sale_price_ex_vat").change ->
    ex = $("#sale_price_ex_vat").val()
    inc = Math.round(ex*1.2*100)/100.0
    console.log("Ex VAT #{ex}")
    $("#sale_price_inc_vat").val(inc)
  $("#sale_price_inc_vat").change ->
    inc = $("#sale_price_inc_vat").val()
    ex = Math.round(inc/1.2*100)/100.0
    console.log("Inc VAT #{inc}")
    $("#sale_price_ex_vat").val(ex)
  $("#sale_markup").change ->
    console.log("Inc VAT #{inc}")
    markup = $("#sale_markup").val()
    ex = parseFloat($("#purchase_price_ex_vat").text())
    inc = parseFloat($("#purchase_price_inc_vat").text())
    console.log("Markup Change: #{markup} #{ex} #{inc}")
    $("#sale_price_ex_vat").val(Math.round(ex*markup*100.0)/100.0)
    $("#sale_price_inc_vat").val(Math.round(inc*markup*100.0)/100.0)
