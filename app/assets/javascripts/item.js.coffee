jQuery -> 
  $("#price_ex_vat_id").change ->
    v = $("price_ex_vat_id").val()
    console("Ex VAT #{v}")
    $("#price_inc_vat_id").val(v*1.2)

