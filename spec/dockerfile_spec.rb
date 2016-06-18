require "serverspec"
require "docker"

describe "Dockerfile Check" do
  before(:all) do
    image = Docker::Image.build_from_dir('./docker/')
    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  describe command("lsb_release -a") do
    its(:stdout) { should match /Ubuntu 14/ }
  end

  describe package("apache2") do
    it { should be_installed }
  end

  describe process("apache2") do
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end

end
