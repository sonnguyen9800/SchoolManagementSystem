class Downvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.references :course, foreign_key: true
      t.references :coordinator, foreign_key: true
      t.timestamps
    end
  end
end
