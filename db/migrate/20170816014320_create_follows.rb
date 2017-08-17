class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :uid
      t.integer :fid

      t.timestamps
    end
  end
end
