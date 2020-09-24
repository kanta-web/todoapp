class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :user,null: false
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
