class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :username,        :null => false, :default => ""
      t.string :password_digest, :null => false, :default => ""
      t.integer :owner_id,       :null => false, :default => ""
      t.string :owner_type,      :null => false, :default => ""

      t.timestamps :null => false
    end

    execute(
      "CREATE UNIQUE INDEX index_credentials_on_username ON credentials (lower(username))"
    )
  end
end
