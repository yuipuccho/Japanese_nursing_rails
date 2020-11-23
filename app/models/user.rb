# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  auth_token             :string(255)      not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :integer          default("anonymous")
#  sign_in_count          :integer          default(0), not null
#  user_name              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable, :trackable,
         authentication_keys: [:login]

  has_many :test_histories
  has_many :learning_histories
  has_one :user_learning_target

  enum role: { anonymous: 0, normal: 1, admin: 2 }

  validates :user_name, length: {
    minimum: 1, maximum: 12
  }, presence: true

  def add_auth_token
    self.auth_token = Devise.friendly_token
  end
end
