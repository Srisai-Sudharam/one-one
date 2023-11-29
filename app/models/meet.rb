class Meet < ApplicationRecord
    validates :agenda, presence: true
    belongs_to :manager, class_name: "Employee"
    belongs_to :employee
end
