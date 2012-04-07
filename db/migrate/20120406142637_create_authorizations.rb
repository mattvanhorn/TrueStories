class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table "authorizations", :force => true do |t|
      t.integer  "user_id"
      t.string   "provider"
      t.string   "uid"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
    end
  end
end
