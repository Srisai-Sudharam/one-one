require 'rails_helper'

RSpec.describe "Meets", type: :request do
  let(:manager) {create :manager}
  let(:employee){create :employee, manager: manager}
  let(:another_employee) {create :employee, email: "emp1@gmail.com", manager: manager}

  let(:hr) {create :hr}
  let!(:meeting) {create :meet, employee: employee, manager: manager}


  describe "login as a manager" do

    before do 
      sign_in manager
    end
    
    it "should create new meeting" do
      post "/meets", params: {meet: {agenda: "agenda", employee_id: employee.id}}
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["message"]).to eq("meeting created successfully")

    end

    it "should update a meeting" do 
      patch "/meets/#{meeting.id}", params: {meet: {agenda: "new agenda", employee_id:another_employee.id }}
      expect(JSON.parse(response.body)["message"]).to eq("meeting_details updated successfully")
    end

    it "should destroy a meeting" do
      
      expect {
        delete "/meets/#{meeting.id}"
    }.to change{Meet.count}.by(-1)

    expect(JSON.parse(response.body)["message"]).to eq("meeting destroyed successfully")


    end

  end

  describe "login as employee" do 
    before do 
      sign_in employee
    end

    it "should not create meeting" do
      post "/meets", params: {meet: {agenda: "agenda", employee_id: employee.id}}
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")
    
    end

    it "should not update meeting" do 
      patch "/meets/#{meeting.id}", params: {meet: {agenda: "new agenda", employee_id:another_employee.id }}
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")
      
    end

    it "should not delete meeting" do
        delete "/meets/#{meeting.id}"
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")
    end
  end

  describe "login as hr" do 
    before do 
      sign_in hr
    end

    it "should not create meeting" do
      post "/meets", params: {meet: {agenda: "agenda", employee_id: employee.id}}
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")    
    end

    it "should not update meeting" do 
      patch "/meets/#{meeting.id}", params: {meet: {agenda: "new agenda", employee_id:another_employee.id }}
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")
    end

    it "should not delete meeting" do
        delete "/meets/#{meeting.id}"
        expect(response).to have_http_status(:forbidden)
        expect(JSON.parse(response.body)["message"]).to eq("You are not authorized to perform this task")
    end
  end


end
