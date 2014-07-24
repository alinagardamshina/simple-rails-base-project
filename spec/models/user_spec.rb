require 'rails_helper'

describe User do
  subject { create :user, email: 'test@example.com' }
  it { is_expected.to validate_presence_of :full_name }

  describe '#to_s' do
    it 'returns full_name' do
      expect(subject.to_s).to eql 'John Smith'
    end
  end

  describe '#full_name_with_email' do
    it 'returns full_name with email' do
      expect(subject.full_name_with_email).to eql 'John Smith (test@example.com)'
    end
  end
end
