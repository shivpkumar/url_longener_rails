class CreateTables < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original_url, :long_url_hash
      t.integer :click_count, default: 0
      t.references :user
      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name, :last_name, :email, :password_digest
      t.timestamps
    end
  end
end
