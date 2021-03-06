class Actor < ApplicationRecord
   has_secure_password

   validates_presence_of :name
   validates_presence_of :email
   validates_uniqueness_of :email, case_sensitive: false
   validates_format_of :email, with: /@/

   has_many :events, dependent: :destroy

   def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
   end

   def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
   end

   def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
   end

   private

   def generate_token
    SecureRandom.hex(10)
   end


end
