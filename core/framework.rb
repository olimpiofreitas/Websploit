require_relative 'module_loader'

module Websploit
  class Framework
    def initialize
      @modules = ModuleLoader.load_modules
      @instance = nil
      @current_module = nil
    end

    def banner
      puts <<~BANNER
               __                                                                
   _______  __/ /_  ____  _________ _      ______________ _____  ____  ___  _____
  / ___/ / / / __ \\/ __ \\/ ___/ __ `/_____/ ___/ ___/ __ `/ __ \\/ __ \\/ _ \\/ ___/
 / /__/ /_/ / /_/ / /_/ / /  / /_/ /_____(__  ) /__/ /_/ / / / / / / /  __/ /    
 \\___/\\__, /_.___/\\____/_/   \\__, /     /____/\\___/\\__,_/_/ /_/_/ /_/\\___/_/     
     /____/                 /____/                                               
                                                  Websploit Framework v1.0

      Type `help` to list commands.

      BANNER
    end

    def console
      loop do
        prompt = @current_module ? "websploit (#{@current_module}) > " : "websploit > "
        print prompt
        input = gets.strip.downcase
        case input
        when "exit", "quit"
          puts "Bye!"
          break
        when "help"
          puts "Available commands: help, list, use, set, show options, run, save, load, exit"
        when "list"
          @modules.each_key { |m| puts "- #{m}" }
        when /^use (.+)/
          name = $1
          if @modules.key?(name)
            @instance = @modules[name].new
            @current_module = name
          else
            puts "Module not found"
          end
        when /^set (\w+) (.+)/
          if @instance
            option_name = $1.upcase
            @instance.set_option(option_name, $2)
          else
            puts "No module selected"
          end
        when "show options"
          if @instance
            @instance.show_options
          else
            puts "No module selected"
          end
        when "run"
          if @instance
            @instance.run
          else
            puts "No module selected"
          end
        when "save"
          if @instance
            File.write("session_#{@current_module.gsub('/', '_')}.json", JSON.pretty_generate(@instance.options.transform_values { |v| v[:current] }))
            puts "[*] Session saved."
          end
        when "load"
          if @instance
            file = "session_#{@current_module.gsub('/', '_')}.json"
            if File.exist?(file)
              data = JSON.parse(File.read(file))
              data.each { |k, v| @instance.set_option(k, v) }
              puts "[*] Session loaded."
            else
              puts "Session not found."
            end
          end
        else
          puts "Unknown command"
        end
      end
    end
  end
end
