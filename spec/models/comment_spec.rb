require 'rails_helper'

describe Comment do
  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :article_id }
end
