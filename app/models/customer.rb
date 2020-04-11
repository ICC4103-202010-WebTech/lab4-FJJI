

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
        value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class Customer < ApplicationRecord
  include ActiveModel::Validations
  attr_accessor :name, :email

  has_many :orders
  has_many :tickets, through: :orders
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true
  validates :lastname, presence: true
end
