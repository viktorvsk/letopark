# frozen_string_literal: true

class Device < ApplicationRecord
  after_initialize :build_new_device

  belongs_to :customer, autosave: true

  validates :access_token, :refresh_token, presence: true
  validates_associated :customer

  private

  def build_new_device
    self.refresh_token ||= SecureRandom.alphanumeric(36)
    self.access_token ||= SecureRandom.alphanumeric(36)
    self.customer ||= Customer.new
  end
end
