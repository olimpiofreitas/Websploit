require_relative '../../core/base_module'

module Websploit
  class PortScan < Websploit::BaseModule
    path 'auxiliary/port_scan'

    register_option 'TARGET', default: '', required: true, description: 'Target host'
    register_option 'PORTS', default: '80,443,8080', required: false, description: 'Ports to scan'
    register_option 'THREADS', default: '10', required: false, description: 'Number of threads'

    def run
      target = options["TARGET"][:current]
      ports = options["PORTS"][:current]
      threads = options["THREADS"][:current]

      puts "[*] Scanning #{target}"
      puts "[*] Ports: #{ports}"
      puts "[*] Threads: #{threads}"
      # Implementação do scan aqui
    end
  end
end 