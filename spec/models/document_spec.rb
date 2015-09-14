require 'spec_helper'

describe Document do
  let(:document) { FactoryGirl.create(:document, :with_tagging) }

  context 'relationships' do
    it 'can be tagged with keywords' do
      expect(document.keywords.count).to eq(2)
    end
  end
  context 'validations' do
    it 'validates attributes' do
      expect(document).to validate_presence_of(:title)
      expect(document).to validate_presence_of(:body)
    end
  end
end
