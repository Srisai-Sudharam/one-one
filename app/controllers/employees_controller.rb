class EmployeesController < ApplicationController
  
  before_action :authenticate_employee!
  load_and_authorize_resource
  
  before_action :find_employee, only: [:update, :destroy]
  
  def index
    render json: {employees: Employee.all.order(:email)}
  end
  
  def create
    Employee.create!(employee_params)
    render json:{message: "employee created successfully"}, status: :created
  end
  
  
  def update
    @employee.update!(employee_params)
    render json: {message: "details updated"}
  end

  
  def update_password
    current_employee.update!(password_params)
    render json: {message: "Password updated successfully"}
  end

  
  def destroy
    @employee.destroy!
    render json: {message: "Employee destroyed successfully"}
  end
  
  
  
  def created_meetings
    render json: {created_meetings: current_employee.created_meetings}
  end
  
  def participated_meetings
    render json: {meetings: current_employee.participated_meetings}
  end
  
  def subordinates
    render json: {subordinates: current_employee.subordinates }
  end
  
  def manager
    render json: {manager: current_employee.manager}
  end
  


  
  private 
  
  def employee_params
    params.require(:employee).permit(:email, :role, :manager_id, :password)
  end
  
  def password_params
    params.require(:employee).permit(:password)
  end
  
  def find_employee 
    @employee = Employee.find(params[:id])
  end
  

end
