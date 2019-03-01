class AddAuthorToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :author, index: true
    add_foreign_key :posts, :users, column: :author_id
  end
end
