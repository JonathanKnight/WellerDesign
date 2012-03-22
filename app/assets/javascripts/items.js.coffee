jQuery ->
  items = $('#estimate_elements_attributes_0_item_id').html()
  console.log("items")
  console.log(items)
  $('#estimate_suppliers_supplier_id').change -> update_group_select('#estimate_suppliers_supplier_id',
      '#estimate_elements_attributes_0_item_id',items)
  update_group_select('#estimate_suppliers_supplier_id','#estimate_elements_attributes_0_item_id',items)
  
update_group_select = (id_selected, id_to_change, grouped_items) ->  
  console.log("Chosen #{id_selected}")
  selected = $("#{id_selected} :selected").text()
  console.log(selected)
  #escaped_selected = selected.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(grouped_items).filter("optgroup[label='#{selected}']").html()

  console.log(options)
  if options
    $("#{id_to_change}").html(options)
  else
    $("#{id_to_change}").empty()
    
update_group_select_obj = (id_selected, id_to_change, grouped_items) ->  
  #console.log("Chosen #{id_selected.attr('id')}")
  selected_val = id_selected.val()
  selected = id_selected.children().filter("[value = '#{selected_val}']").text()
  #console.log(grouped_items)
  #console.log("##{id_selected.attr('id')} :selected").text()
  #console.log(selected)
  #escaped_selected = selected.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(grouped_items).filter("optgroup[label='#{selected}']").html()

  console.log(options)
  if options
    id_to_change.html(options)
  else
    id_to_change.empty()
    
$("form").live "nested:fieldAdded", (event) ->
  console.log event.type
  sel = event.field.children().eq(0).children().eq(1).children().eq(0)
  item = event.field.children().eq(1).children().eq(1).children().eq(0)
  console.log sel.attr('id')
  console.log item.attr('id')
  items = item.html()
  sel.change -> update_group_select_obj(sel,item,items)
  update_group_select_obj(sel,item,items)
  

