class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable

  validates_format_of :email, with: Devise::email_regexp
  scope :confirmed, -> { where.not(confirmed_at: nil) }

  scope :pending_confirmation, -> (start_date, end_date) { where(confirmation_sent_at: (start_date..end_date)) }
end
