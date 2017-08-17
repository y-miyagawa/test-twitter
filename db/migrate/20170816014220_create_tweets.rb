class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :uid
      t.integer :rtid
      t.text :content

      t.timestamps
    end
  end
end
