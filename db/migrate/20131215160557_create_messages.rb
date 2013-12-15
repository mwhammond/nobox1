class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :cc
      t.string :from
      t.string :message
      t.datetime :received

      t.timestamps
    end
  end
end
