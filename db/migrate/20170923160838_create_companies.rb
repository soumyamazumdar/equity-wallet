class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name	
      t.integer :unique_id
      t.timestamps
    end
  end
end
