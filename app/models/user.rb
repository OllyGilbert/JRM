class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :first_name, :last_name, :username, :image
  # attr_accessible :title, :body

  has_many :media_lists
  has_many :journalists, through: :media_lists
  has_many :comments

  has_many :providers, dependent: :destroy

  def self.map_authentication_to_user_properties(authentication)
    authentication.slice(:info, :provider, :uid, :user_id)
  end

  def populate_user_fields(auth, user, kind)
    case kind
    when "Twitter"
      user.name = auth.info.name if !auth.info.name.nil? && user.name.blank?
      user.image = auth.info.image if !auth.info.image.nil? && user.image.blank?
      user.username = auth.info.nickname if !auth.info.nickname.nil? && user.username.blank?
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!) 
    when "Google"
      user.name = auth.info.name if !auth.info.name.nil? &&user.name.blank?
      user.image = auth.info.image if !auth.info.image.nil? && user.image.blank?
      user.email = auth.info.email if !auth.info.email.nil? && user.email.blank?
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!) 
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.authentication"]
 
        user.username = auth.info.nickname if user.username.blank?
        user.name = auth.info.name if user.name.blank?
        user.email = auth.info.email if user.email.blank?
        user.image = auth.info.image if user.image.blank?
        user.skip_confirmation! if user.respond_to?(:skip_confirmation!) # don't require email confirmation
      end
    end
  end

end
