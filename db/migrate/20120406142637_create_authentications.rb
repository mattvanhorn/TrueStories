class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table "authentications", :force => true do |t|
      t.integer  "user_id"
      t.string   "provider"
      t.string   "uid"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
    end
  end
end
