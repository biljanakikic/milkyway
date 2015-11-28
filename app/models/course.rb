class Course
  include ActiveModel::Validations
  validates_presence_of :title
  attr_accessor :title
end
