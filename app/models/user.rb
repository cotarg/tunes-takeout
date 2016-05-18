class User < ActiveRecord::Base
  # validations
  validates :name, :uid, :provider, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    # Find or create a user
    user = self.find_by(provider: auth_hash["provider"], uid: auth_hash["uid"])
    
    if !user.nil?
      return user
    else
      make_user(auth_hash)
    end
  end

  private

  def make_user
    user = User.new
    user.name = auth_hash["info"]["name"]
    user.uid = auth_hash["uid"]
    user.email = auth_hash["info"]["email"]
    user.provider = auth_hash["provider"]
    user.image = auth_hash["info"]["image"]
    if user.save
      return user
    else
      return nil
    end
  end

end
