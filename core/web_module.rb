module Websploit
  class WebModule
    attr_reader :name, :description, :options

    def initialize
      @name = "Unnamed Module"
      @description = "No description provided"
      @options = {}
    end

    def get_option(key)
      @options[key]
    end

    def set_option(key, value)
      @options[key] = value
    end

    def show_options
      puts "\nOptions:"
      @options.each do |key, value|
        puts "  #{key.ljust(15)} => #{value}"
      end
      puts ""
    end

    def run
      puts "[!] run() não implementado neste módulo."
    end
  end
end

