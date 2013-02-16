require "unveil/version"
require "unveil/routing"
require "unveil/humanize"

module Unveil
  class Application
    def call(env)
      return four_oh_four if unsupported_file_request(env)

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      code, text = content(controller, act)

      [
        code,
        { 'Content-Type' => 'text/html' },
        [text]
      ]
    end

    private

    # TODO: Class Extract
    def content controller, action
      begin
        text = controller.public_send(action)

        [200, text]
      rescue
        [502, 'An error occured! Probably those weasels again...!?']
      end
    end

    # HACK
    def unsupported_file_request(env)
      env["PATH_INFO"] == '/favicon.ico'
    end

    def four_oh_four
      [
        404,
        { 'Content-Type' => 'text/html'},
        []
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
