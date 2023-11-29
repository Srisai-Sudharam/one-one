require 'rails_helper'

RSpec.describe Meet, type: :model do
  context "while creating a meet" do 
    
    let(:manager)  {create :manager}
    let(:employee)  {create :employee, manager: manager}


    it "is valid with valid attributes" do
      meet = build(:meet, employee: employee, manager: manager)
      expect(meet).to be_valid
    end

    it "is not valid without agenda" do
      meet = build(:meet, agenda: nil, employee: employee, manager: manager)
      expect(meet).not_to be_valid
    end

    it "is not valid without employee_id" do
      meet = build(:meet, employee_id: nil, manager: manager)
      expect(meet).not_to be_valid
    end

    it "is not valid without manager_id" do
      meet = build(:meet, manager_id: nil, employee: employee)
      expect(meet).not_to be_valid
    end

  end

end
