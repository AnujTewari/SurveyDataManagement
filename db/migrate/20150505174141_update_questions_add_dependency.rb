class UpdateQuestionsAddDependency < ActiveRecord::Migration
  def change
    add_column :questions, :dependency, :string
  end
end
