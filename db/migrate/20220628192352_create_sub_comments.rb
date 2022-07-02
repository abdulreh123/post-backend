class CreateSubComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_comments do |t|
      t.string :content
      t.string :user

      t.timestamps
    end
  end
end
