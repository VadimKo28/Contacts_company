class AddTitleToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :title, :string
  end
end
