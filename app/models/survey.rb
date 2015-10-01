class Survey < ActiveRecord::Base
  attr_accessible :survey_name, :surveyor_name, :description, :survey_creation_date, :questions_order
  validates :survey_name, :presence => true
  validates :surveyor_name, :presence => true
  #validates :description, :presence => true

  def self.to_csv1
    CSV.generate do |csv|
      csv << column_names ## Header values of CSV
      all.each do |emp|
        csv << emp.attributes.values_at(*column_names) ##Row values of CSV
      end
    end
  end
end
