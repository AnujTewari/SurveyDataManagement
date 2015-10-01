class UpdateSurveysAddOrdering < ActiveRecord::Migration
  def change
    add_column :surveys, :questions_order, :string
  end
end
