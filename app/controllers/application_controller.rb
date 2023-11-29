class ApplicationController < ActionController::API

    rescue_from CanCan::AccessDenied do |exception|
        exception.default_message = "You are not authorized to perform this task"
        render json: {message: exception.message}, status: :forbidden
        end
    
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_input

    rescue_from ActiveRecord::RecordNotDestroyed, with: :invalid_input

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def current_ability
        @current_ability ||= Ability.new(current_employee)
    end


    private

    def invalid_input(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end


    def record_not_found(e)
        render json: {errors: e.message}, status: :not_found
    end
end
