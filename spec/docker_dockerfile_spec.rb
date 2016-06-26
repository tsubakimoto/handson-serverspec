#require "serverspec"
#require "docker"
require "spec_helper"

describe "Dockerfile Check" do
  #
  # 最初に一度だけ実行される
  #
  before(:all) do
    image = Docker::Image.build_from_dir("./docker/", { "nocache" => "true"})
    set :os, family: :debian
    # set :backend, :docker       # Serverspec の Docker バックエンドを利用してテスト
    set :docker_image, image.id
  end

  describe command("lsb_release -a") do
    its(:stdout) { should match /Ubuntu 14/ }
  end

  %w(apache2 php5).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  describe process("apache2") do
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end

end
