# frozen_string_literal: true

class Customer < ApplicationRecord
  attr_accessor :verification_code

  has_many :orders, dependent: :destroy
  has_many :devices, dependent: :destroy

  has_one :verification_request, foreign_key: :phone, primary_key: :phone, dependent: :destroy, inverse_of: :customer

  validates :phone, phone: true, allow_nil: true
  validate :check_phone_verification_code, if: :phone_changed?

  after_save :destroy_verification_code

  private

  def check_phone_verification_code
    return if VerificationRequest.where(phone: phone, code: verification_code).exists?

    errors.add(:phone, 'verification code invalid')
  end

  def destroy_verification_code
    return unless verification_code

    VerificationRequest.where(phone: phone, code: verification_code).destroy_all
  end
end
