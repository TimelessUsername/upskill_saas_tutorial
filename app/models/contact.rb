# Contact form validations work in progress.

class EmailValidator < ActiveModel::Validator
    def validate(contact_params)
        unless contact_params[:email].include?("@")
            contact_params.errors[:base] << "Email must contain @ symbol"
        end
    end
end

class Contact < ActiveRecord::Base
    validates :name, :comments, :email, presence: true
    validates :name, :comments, :email, length: { minimum: 2, message: "2 Letters minimum" }
    validates :name, :comments, :email, length: { maximum: 254, message: "254 Letters maximum" }
    validates_with EmailValidator
end

