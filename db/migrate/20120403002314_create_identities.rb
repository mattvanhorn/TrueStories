class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.belongs_to :user
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
