class AddStoriesTable < ActiveRecord::Migration
  def change
    create_table :stories, :force => true do |t|
      t.string :title
      t.text  :body
      t.timestamps
    end
  end
end