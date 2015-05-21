require 'spec_helper'

RSpec.describe 'edge case mode' do
  it 'does' do
    FactoryHelper::Config.locale = 'en'
    5.times { puts rand }
    5.times { puts FactoryHelper::Name.male_name }
  end
end
