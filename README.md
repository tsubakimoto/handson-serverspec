# Serverspec ハンズオン資料

## なにこれ

- [DevOps勉強会 #3 Serverspecの巻](http://peatix.com/event/176876/) にて利用予定の資料...

## ファイル

### ファイル一覧

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── backends
│   ├── dockerfile_backend.rb
│   └── shellscript_backend.rb
├── docker
│   ├── Dockerfile
│   └── index.html
└── spec
    ├── docker_dockerfile_spec.rb
    ├── docker_site_spec.rb
    ├── local_exec_spec.rb
    └── spec_helper.rb

3 directories, 12 files
```

## 使い方

### backends

```
# Dockerfile を出力します
bundle exec ruby backends/dockerfile_backend.rb

# Shell Script を出力します
bundle exec ruby backends/shellscript_backend.rb
```

### spec

```
bundle exec rspec spec/local_exec_spec.rb
bundle exec rspec spec/docker_dockerfile_spec.rb
bundle exec rspec spec/docker_site_spec.rb
```
