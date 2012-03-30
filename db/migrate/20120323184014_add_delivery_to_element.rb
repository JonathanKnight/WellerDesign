class AddDeliveryToElement < ActiveRecord::Migration
  def change
    add_column :elements, :delivery_address, :text

  end
end
