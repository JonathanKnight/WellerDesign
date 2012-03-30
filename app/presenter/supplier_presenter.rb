class SupplierPresenter < BasePresenter

  presents :supplier
  
  def actions
    if supplier.outstanding_purchases.count > 0
      (h.link_to "Create PO", h.new_purchaseorder_path(:supplier_id => supplier.id), :class => 'btn btn-mini btn-primary')
    else
      (h.link_to "Edit", h.edit_supplier_path(supplier),:class => 'btn btn-mini')
    end
  end
end

