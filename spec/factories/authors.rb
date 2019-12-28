# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { 'JetBrains' }
    website { 'https://habr.com/ru/company/jetbrains/' }
  end
end
