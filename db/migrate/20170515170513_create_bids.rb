class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :price
      t.references :auction, foreign_key: true, index: true

      t.timestamps
    end
  end
end
