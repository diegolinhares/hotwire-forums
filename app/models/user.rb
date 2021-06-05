# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :discussion_subscriptions, dependent: :destroy
  has_many :notifications, as: :recipient

  validates :username, presence: true, uniqueness: true

  has_many :discussions, dependent: :destroy
end
