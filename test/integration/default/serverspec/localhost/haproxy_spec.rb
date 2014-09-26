require 'spec_helper'

describe 'HAProxy' do

  describe service("haproxy") do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/etc/default/haproxy') do
    it { should be_file }
    its(:content) { should match /ENABLED=1/ }
  end

  describe file('/etc/haproxy/haproxy.cfg') do
    it { should be_file }
    its(:content) { should match /10.11.12.100:80/ }
    its(:content) { should match /10.11.12.101:80/ }
  end

  describe command('which haproxy') do
    it { should return_stdout /\/usr\/sbin\/haproxy*/ }
  end

  describe command('service haproxy') do
    it { should return_stdout /\/etc\/init.d\/haproxy*/ }
  end

  describe port(80) do
    it { should be_listening }
  end

end