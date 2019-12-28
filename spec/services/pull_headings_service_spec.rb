# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PullHeadingsService do
  let(:service) { described_class.new }
  let(:author) { create(:author) }

  describe '#call' do
    subject(:result) { service.call(author) }

    context 'with valid website', vcr: { cassette_name: 'jetbrains' } do
      let(:headings) do
        ['Делаем эффективные инструменты для разработчиков',
         'Планы команды IntelliJ Platform на 2020 год',
         'Производительность']
      end

      it { is_expected.to be_success }

      it 'pulls headings' do
        result
        expect(author.headings[0..2]).to eq(headings)
      end
    end

    context 'with invalid website', vcr: { cassette_name: 'google' } do
      let(:author) { create(:author, website: 'https://google.com') }

      it { is_expected.to be_failure }
    end
  end
end
