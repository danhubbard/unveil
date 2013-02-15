require "unveil/version"

module Unveil
  class Application
    def call(env)
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['Hello to an unveiled world!']
      ]
    end
  end
end
