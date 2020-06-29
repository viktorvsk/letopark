# frozen_string_literal: true

FactoryBot.define do
  factory :verification_request do
    phone { "93111#{rand(1000..9999)}".to_i }
    after(:build) do |request|
      request.code ||= rand(1000..9999)
    end
  end
end
