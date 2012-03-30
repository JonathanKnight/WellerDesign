class PurchasePresenter < BasePresenter

  presents :purchase
  
  def actions
    if purchase.purchaseorder
    else
    end
  end
  
  def purchaseorderlink
    if purchase.purchaseorder
      (h.link_to purchase.purchaseorder_id, purchase.purchaseorder)
    else
    end
  end
end
