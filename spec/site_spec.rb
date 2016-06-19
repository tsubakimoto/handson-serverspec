require "infrataster/rspec"

#
# テストの最後に実行される処理を定義
#  - コンテナを削除する
#
RSpec.configure do |config|
  config.after(:suite) do
    container.delete(:force => true)
  end
end

#
# Infrataster のテストで利用するコンテナを用意する定義
#  - コンテナをビルドする
#  - コンテナを起動する（コンテナを作成して start する）
#  - コンテナの IP アドレスを取得する
#
image = Docker::Image.build_from_dir("./docker/")
container = Docker::Container.create("Image" => image.id)
container.start
ip = container.json["NetworkSettings"]["IPAddress"]

#
# Infrataster のサーバー定義
#
Infrataster::Server.define(:docker) do |s|
  s.address = ip
end

#
# Infrataster によるサイトの振る舞いテスト
#
describe "Site Check" do

  describe server(:docker) do
    describe http("http://docker") do
      it "responds as 'text/html'" do
        expect(response.headers['content-type']).to match(%r{^text/html})
      end
      it "responds as '200'" do
        expect(response.status).to be 200
      end
      it "responds as 'test'" do
        expect(response.body).to include("test")
      end
    end
  end

end
