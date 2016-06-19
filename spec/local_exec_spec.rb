require 'serverspec'

set :backend, :exec

describe "OS のバージョンは Ubuntu 14.04 であることを確認する" do
  describe command("lsb_release -a") do
    its(:stdout) { should match /Ubuntu 14.04/ }
  end
end

describe "docker-engine がインストールされていることを確認する" do
  describe package('docker-engine'), :if => os[:family] == 'ubuntu' do
    it { should be_installed }
  end
end

describe "docker-engine 起動していることを確認する" do
  describe service('docker'), :if => os[:family] == 'ubuntu' do
    it { should be_running }
  end
end

describe "Ruby や servespec / infrataster がインストールされていることを確認する" do
  it "インストールされている Ruby のバージョンは 2.3.1 である" do
    expect(check_ruby_version).to include("2.3.1")
  end

  it "Serverspec がインストールされている" do
    expect(check_packages("serverspec")).to include("serverspec")
  end

  it "Infrataster がインストールされている" do
    expect(check_packages("infrataster")).to include("infrataster")
  end
  
  def check_ruby_version
    command("ruby -v").stdout
  end

  def check_packages(package)
    command("bundle exec gem list | grep #{package}").stdout
  end

end
