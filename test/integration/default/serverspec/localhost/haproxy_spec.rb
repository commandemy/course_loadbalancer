require 'spec_helper'

describe 'HAProxy' do

  describe service("haproxy") do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('which haproxy') do
    it { should return_stdout /\/usr\/sbin\/haproxy/ }
  end

  describe port(80) do
    it { should be_listening }
  end

  describe port(8080) do
    it { should be_listening }
  end

  # Config file should exist

  # Config file should contain
  # - stats enable
  # - balanace round robin
  # - server app1 10.0.0.1:80 check
  # - server app2 10.0.0.2:80 check

end