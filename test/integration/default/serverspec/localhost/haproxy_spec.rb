require 'spec_helper'

describe 'HAProxy' do

  describe service("haproxy") do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('service haproxy') do
    it { should return_stdout /\/etc\/init.d\/haproxy/ }
  end

  describe port(80) do
    it { should be_listening }
  end

  # Config file should exist

  # Config file should contain
  # - stats enable
  # - balanace round robin
  # - server app1 10.0.0.1:80 check
  # - server app2 10.0.0.2:80 check

end