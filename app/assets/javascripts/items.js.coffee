jQuery ->
  items = $('#estimate_elements_attributes_0_item_id').html()
  console.log(items)
  $('#estimate_suppliers_supplier_id').change ->
    supplier = $('#estimate_suppliers_supplier_id :selected').text()
    options = $(items).filter("optgroup[label=#{supplier}]").html()
    console.log("Chosen")
    console.log(supplier)
    console.log(items)
    console.log(options)
    if options
      $('#estimate_elements_attributes_0_item_id').html(options)
    else
      $('#estimate_elements_attributes_0_item_id').empty()
