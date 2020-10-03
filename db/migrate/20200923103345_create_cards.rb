class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user,null: false
      t.references :board,null: false
      t.string :name
      t.text :content,null: false
      # t.integer :limit
      t.timestamps
    end
  end
end
