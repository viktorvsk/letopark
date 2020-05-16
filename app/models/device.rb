# frozen_string_literal: true

class Device < ApplicationRecord
  belongs_to :customer
  validates :access_token, :refresh_token, presence: true
end
