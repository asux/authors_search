# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PullHeadingsService do
  let(:service) { described_class.new }
  let(:author) { create(:author) }

  describe '#call' do
    subject(:result) { service.call(author) }

    let(:headings) do
      [
        'Планы команды IntelliJ Platform на 2020 год',
        'YouTrack 2019.3: обновленный список задач и многое другое',
        'IntelliJ IDEA 2019.3: оптимизация производительности и улучшение качества'
      ]
    end

    it 'pulls headings' do
      result
      expect(author.headings[0..2]).to eq(headings)
    end
  end
end
