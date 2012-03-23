class EstimatePresenter < BasePresenter

  presents :estimate
  
  def actions
    if estimate.sale      
    elsif estimate.finished
      (h.link_to 'Sell', h.new_sale_path(:estimate_id => estimate.id, :quantity => estimate.quantity,
          :price_ex_vat => estimate.price_ex_vat*estimate.room.job.markup,
          :price_inc_vat => estimate.price_inc_vat*estimate.room.job.markup),
          :class => 'btn btn-mini btn-primary') + 
      (h.link_to 'Edit', h.edit_estimate_path(estimate), :class => 'btn btn-mini')
    elsif estimate.started
      h.link_to 'Edit', h.edit_estimate_path(estimate), :class => 'btn btn-mini'
    else
      (h.link_to 'Edit', h.edit_estimate_path(estimate), :class => 'btn btn-mini') + 
      (h.link_to 'Destroy', h.estimate_path(estimate), :method => :delete, :confirm => 'Are you sure?', :class => 'btn btn-mini btn-danger')

    end
  end
  
  def sale_created_at
    if estimate.sale
      estimate.sale.created_at
    else

    end
  end
  
  def sale_value
    if estimate.sale
      estimate.sale.value
    else
    end
  end
  
end
