require 'serverspec'
require 'docker'

set :docker_container, ENV['DOCKER_CONTAINER']

if ENV['CIRCLECI']
  set :backend, :exec
else
  set :backend, :docker
end
