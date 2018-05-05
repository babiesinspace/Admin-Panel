class Salary < ApplicationRecord
  belongs_to :payable, polymorphic: true
end
