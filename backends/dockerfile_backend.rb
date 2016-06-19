require "specinfra"
require "specinfra/helper/set"

include Specinfra::Helper::Set

set :backend, :dockerfile
set :os, :family => "ubuntu"

Specinfra.backend.from("ubuntu")
Specinfra::Runner.install_package("nginx")
