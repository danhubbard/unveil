require "unveil/version"
require "unveil/routing"
require "unveil/humanize"

module Unveil
  class Application
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.public_send(act)

      [
        200,
        { 'Content-Type' => 'text/html' },
        [text]
      ]
    end
      ]
    end
  end

  class Controller
    attr_reader :env
    def initialize env
      @env = env
    end
  end
end
