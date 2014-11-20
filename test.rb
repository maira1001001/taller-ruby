require 'minitest/autorun'

class URLSplitter

  def initialize(url)
    
  end

end

class TestTest < Minitest::Test
  def test_instantiate_url_sppliter
    us = URLSplitter.new 'https://www.google.se'
    assert us.instance_of? URLSplitter
  end
end
