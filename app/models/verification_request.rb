# frozen_string_literal: true

class VerificationRequest < ApplicationRecord
  validates :code, inclusion: { in: 1000..9999 }
  validates :phone, phone: true
  belongs_to :customer, foreign_key: :phone, optional: true

  def set_code
    self.code = rand(1000..9999)
  end
end
