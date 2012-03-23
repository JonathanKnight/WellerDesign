class AddImageToItem < ActiveRecord::Migration
  def change
    add_column :items, :image, :string

    add_column :items, :reference, :string

  end
end
