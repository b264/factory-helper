# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class TesetFakerEnCaLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'en-CA'
  end

  def teardown
    Faker::Config.locale = @previous_locale
  end

  def test_ca_postcode
    expected = /[A-VX-Y][0-9][A-CEJ-NPR-TV-Z] ?[0-9][A-CEJ-NPR-TV-Z][0-9]/
    assert_match(expected, Faker::Address.postcode)
  end

end
