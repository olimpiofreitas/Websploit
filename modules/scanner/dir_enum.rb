
require 'net/http'
require 'uri'
require_relative '../../core/base_module'

module Websploit
  class DirEnum < Websploit::BaseModule
    path 'scanner/dir_enum'

    register_option 'TARGET', default: 'http://localhost', required: true, description: 'Target base URL'
    register_option 'WORDLIST', default: 'admin,login,uploads,config,assets', required: false, description: 'Comma-separated wordlist'
    register_option 'THREADS', default: '5', required: false, description: 'Number of concurrent threads'

    def run
      base_url = options["TARGET"][:current]
      paths = options["WORDLIST"][:current].split(',')
      max_threads = options["THREADS"][:current].to_i

      queue = Queue.new
      paths.each { |path| queue << path }

      threads = []
      max_threads.times do
        threads << Thread.new do
          while !queue.empty?
            path = queue.pop(true) rescue nil
            next unless path

            url = URI.join(base_url + '/', path)
            begin
              res = Net::HTTP.get_response(url)
              puts "[+] Found: #{url}" if res.code.to_i == 200
            rescue => e
              puts "[-] Error accessing #{url} (#{e.message})"
            end
          end
        end
      end

      threads.each(&:join)
    end
  end
end
