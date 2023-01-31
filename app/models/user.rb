class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 } 
  

  def self.authenticate_with_credentials(email, password)
    lowercase_email = email.downcase
    login_email = lowercase_email.strip

    user = User.find_by_email(login_email)

  if user && user.authenticate(password)
    return user
  else 
    return nil
  end
end
  
end
