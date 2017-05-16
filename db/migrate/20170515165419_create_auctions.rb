class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.date :ends_on
      t.integer :reserve

      t.timestamps
    end
  end
end
