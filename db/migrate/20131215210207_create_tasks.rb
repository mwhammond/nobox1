class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.integer :priority
      t.datetime :due
      t.string :messages
      t.integer :percentage

      t.timestamps
    end
  end
end
