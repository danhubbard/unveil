require "unveil/version"
require "unveil/routing"
require "unveil/humanize"

module Unveil
  class Application
    def call(env)
      catch_unsupported_requests(env)
      request_for(env)
    end

    private
    def request_for(env)
      code, text =
        if root_path?(env) then default_response
        else controller_response(env) end

      [code, { 'Content-Type' => 'text/html' }, [text]]
    end

    def root_path? env
      env["PATH_INFO"] == '/'
    end

    def default_response
      [200, File.read('public/index.html')]
    end

    def controller_response(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      controller_content(controller, act)
    end

    # TODO: Class Extract
    def controller_content controller, action
      begin
        text = controller.public_send(action)

        [200, text]
      rescue
        [502, 'An error occured! Probably those weasels again...!?']
      end
    end

    # HACK
    def catch_unsupported_requests(env)
      path_info = env["PATH_INFO"]

      if  path_info == '/favicon.ico'
        return four_oh_four
      end
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
