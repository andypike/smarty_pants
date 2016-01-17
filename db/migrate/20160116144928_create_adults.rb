class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
      t.string :first_name, :null => false, :default => ""
      t.string :last_name,  :null => false, :default => ""
      t.string :email,      :null => false, :default => ""

      t.references :account, :index => true, :foreign_key => true

      t.timestamps :null => false
    end
  end
end
