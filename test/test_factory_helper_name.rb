require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperName < Test::Unit::TestCase

  def setup
    FactoryHelper::Config.locale = nil
    @genderized_test_locales= [:en, 'en-AU'.to_sym, 'en-au-ocker'.to_sym, 'en-BORK'.to_sym, 'en-CA'.to_sym, 'en-GB'.to_sym, 'en-IND'.to_sym, 'en-NEP'.to_sym, 'en-US'.to_sym]
    @tester = FactoryHelper::Name
    @first_name_matcher= /\A[A-Z][\w']+/
  end

  def teardown
    FactoryHelper::Config.locale = nil
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end

  def test_genderized_name
    @genderized_test_locales.each do |locale|
      FactoryHelper::Config.locale= locale
      test_female_name
      test_male_name
    end
  end

private

  def test_female_name
    192.times do
      assert @tester.female_name.match(@first_name_matcher)
    end
  end

  def test_male_name
    48.times do
      assert @tester.male_name.match(@first_name_matcher)
    end
  end

end
