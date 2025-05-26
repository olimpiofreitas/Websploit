
require_relative 'base_module'
require_relative 'web_module'
require 'json'

module Websploit
  module ModuleLoader
    def self.load_modules
      modules = {}
      Dir.glob("modules/**/*.rb").each do |file|
        require_relative "../#{file}"
        klass = ObjectSpace.each_object(Class).find { |c| c < Websploit::BaseModule && c.name.include?(File.basename(file, ".rb").capitalize) }
        mod_path = klass.instance_variable_get(:@mod_path)
        modules[mod_path] = klass if mod_path
      end
      modules
    end
  end
end
