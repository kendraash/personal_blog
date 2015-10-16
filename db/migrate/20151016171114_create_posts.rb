class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :author, :string
      t.column :body, :string
      t.column :tag_id, :integer

      t.timestamps
    end
  end
end
