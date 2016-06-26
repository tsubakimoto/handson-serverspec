require 'serverspec'
require 'docker'
require 'open3'

# https://circleci.com/docs/docker#docker-exec
# https://ja.ngs.io/2015/09/26/circleci-docker-serverspec/

# set :docker_container, ENV['DOCKER_CONTAINER']

if ENV['CIRCLECI']
  module Docker
    class Container
      def exec(command, opts = {}, &block)
        command[2] = command[2].inspect # ['/bin/sh', '-c', 'YOUR COMMAND']
        # cmd = %Q{sudo lxc-attach -n #{self.id} -- #{command.join(' ')}}
        cmd = %Q{sudo lxc-attach -n #{self.id} -- #{command[2]}}
        stdin, stdout, stderr, wait_thread = Open3.popen3 cmd
        # p stdout.read
        # p stderr.read
        # p wait_thread.read
        [stdout.read, [stderr.read], wait_thread.value.exitstatus]
      end
      def remove(options={})
        # do not delete container
      end
      alias_method :delete, :remove
      alias_method :kill, :remove
    end
  end
end
