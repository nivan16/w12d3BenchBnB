class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true

  validates :password, length: {minimum: 6, allow_nil: true} 
  after_initialize :ensure_session_token

  #figvaper celll

  def User.find_by_credentials(username, password) #i do not think this needs to be an instance variable, but remains to be seen. **was not needed!
    user = User.find_by(username: username)
    if user && self.is_password?(password)
      return user
    else
      return nil
    end
  end

  def password #password does need it tho!
    @password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass_obj = BCrypt::password.new(self.password_digest)
    return pass_obj.is_password?(password)
  end

  def generate_session_token
    return SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= self.generate_session_token
    self.save!
    return self.session_token
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    return self.session_token
  end




end
