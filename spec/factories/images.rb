# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    attachment { File.open(Rails.root.join('spec/support/img.png')) }
    after(:build) do |image|
      image.imageable ||= build(:product, image: image)
    end
  end
end
