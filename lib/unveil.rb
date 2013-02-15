require "unveil/version"

module Unveil
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['Hello to an unveiled world!']
      ]
    end
  end
end
