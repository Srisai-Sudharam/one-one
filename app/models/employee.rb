class Employee < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher


  devise :database_authenticatable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id", dependent: :nullify

  

  has_many :created_meetings, class_name: "Meet", foreign_key: "manager_id", dependent: :destroy

  has_many :participated_meetings, class_name: "Meet", dependent: :destroy

  belongs_to :manager, class_name: "Employee", optional: true
  
  enum role: %i[hr manager employee]
  
end