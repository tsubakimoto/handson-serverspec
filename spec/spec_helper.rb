require "infrataster/rspec"

image = Docker::Image.build_from_dir("./docker/")
container = Docker::Container.create("Image" => image.id)
container.start
ip = container.json["NetworkSettings"]["IPAddress"]

Infrataster::Server.define(:docker) do |s|
  s.address = ip
end

RSpec.configure do |config|
  config.after(:suite) do
    container.delete(:force => true)
  end
end
