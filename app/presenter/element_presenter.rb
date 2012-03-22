class ElementPresenter < BasePresenter

  presents :element
  
  def actions
    if element.purchase.nil?
      h.link_to 'Purchase', h.new_purchase_path(:element_id => element.id, :quantity => element.quantity, 
              :price_ex_vat => element.item.price_ex_vat, :price_inc_vat => element.item.price_inc_vat), :class => 'btn btn-primary btn-mini'
      #link_to 'Edit', edit_element_path(element), :class => 'btn btn-mini'
      #link_to 'Destroy', element_path(element), :method => :delete, :confirm => 'Are you sure?', :class => 'btn btn-mini btn-danger'
    elsif element.completed_at.nil?
      h.link_to 'Completed', h.purchase_path(element.purchase.id, :purchase => {:completed_at => Time.now}), :method => :put, :class => 'btn btn-primary btn-mini'
    else
    end
  end
  
end