require "specinfra"
require "specinfra/helper/set"

include Specinfra::Helper::Set

set :backend, :shell_script
set :os, :family => "ubuntu"

Specinfra::Runner.install_package("nginx")
