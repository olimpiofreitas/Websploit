
module Websploit
  class BaseModule
    def self.inherited(subclass)
      subclass.instance_variable_set(:@options, {})
    end

    def self.path(mod_path)
      @mod_path = mod_path
    end

    def self.register_option(name, default:, required:, description:)
      @options[name] = { default: default, required: required, description: description }
    end

    def self.options
      @options
    end

    def options
      self.class.options.transform_values { |opt| opt.merge(current: opt[:default]) }
    end

    def initialize
      @options = options
    end

    def set_option(name, value)
      if @options[name]
        @options[name][:current] = value
      else
        puts "Invalid option"
      end
    end

    def show_options
      puts "Options:"
      @options.each do |name, opt|
        puts "  #{name} = #{opt[:current]} (#{opt[:description]})"
      end
    end

    def export_txt(filename, lines)
      File.open(filename, 'w') { |f| lines.each { |line| f.puts line } }
      puts "[*] Results exported to #{filename}"
    end

    def export_json(filename, data)
      File.write(filename, JSON.pretty_generate(data))
      puts "[*] JSON exported to #{filename}"
    end
  end
end
