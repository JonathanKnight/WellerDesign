class ElementPresenter < BasePresenter

  presents :element
  
  def actions
    if element.purchase.nil?
      if element.item.supplier_id == 6
        (h.link_to 'Start Timesheet', h.timesheets_path(:timesheet => {:user_id => 1, :element_id => element.id, :description => "#{element.item.name} #{element.item.category.name}", 
                :opened_at => Time.now, :closed_at => nil, :chargeable => 'true'}),
                :method => :post,
                :class => 'btn btn-primary btn-mini') +
        (h.link_to 'Completed', h.timesheets_path(:timesheet => {:user_id => 1, :element_id => element.id, :description => "#{element.item.name} #{element.item.category.name}", 
                :opened_at => Time.now, :closed_at => nil, :chargeable => 'true'}),
                :method => :post,
                :class => 'btn btn-primary btn-mini') +
        (h.link_to 'Edit', h.edit_element_path(element), :class => 'btn btn-mini') +
        (h.link_to 'Destroy', h.element_path(element), :method => :delete, :confirm => 'Are you sure?', :class => 'btn btn-mini btn-danger')      
      else
        (h.link_to 'Purchase', h.new_purchase_path(:element_id => element.id, :quantity => element.quantity, 
                :price_ex_vat => element.item.price_ex_vat, :price_inc_vat => element.item.price_inc_vat), 
                :class => 'btn btn-primary btn-mini') +
        (h.link_to 'Edit', h.edit_element_path(element), :class => 'btn btn-mini') +
        (h.link_to 'Destroy', h.element_path(element), :method => :delete, :confirm => 'Are you sure?', :class => 'btn btn-mini btn-danger')
      end
    elsif element.purchase.completed_at.nil?
      (h.link_to 'Completed', h.purchase_path(element.purchase.id, :purchase => {:completed_at => Time.now}), :method => :put, :class => 'btn btn-primary btn-mini')
    else
    end
  end
  
  def purchased_at
    if element.purchase
      element.purchase.created_at
    else
    end
  end
  
  def completed_at
    if element.purchase
      element.purchase.completed_at
    else
    end
  end
  def quantity
    if element.item.quantity == 1
      "#{element.quantity} #{element.item.units}"
    else
      "#{element.quantity} x #{element.item.quantity} #{element.item.units}"
    end
  end
  
end
