#!/usr/bin/env ruby

require 'net/http'
require 'minitest/autorun'
require 'socket'

class JenkinsSampleTest < MiniTest::Unit::TestCase
  def setup
    uri_params = {
      :host => ENV['ec2-54-165-49-110.compute-1.amazonaws.com'] || 'localhost',
      :port => (ENV['TEST_PORT'] || '80').to_i,
      :path => '/index.html'
    }
    @webpage = Net::HTTP.get(URI::HTTP.build(uri_params))
  end

  def test_congratulations
    assert(@webpage =~ /Congratulations/)
  end
end
