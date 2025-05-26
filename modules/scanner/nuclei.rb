
require_relative '../../core/base_module'

module Websploit
  class NucleiScan < Websploit::BaseModule
    path 'scanner/nuclei'

    register_option 'TARGET', default: '', required: true, description: 'Target URL'
    register_option 'TEMPLATE', default: 'cves/', required: false, description: 'Nuclei template path'

    def run
      target = options["TARGET"][:current]
      template = options["TEMPLATE"][:current]
      puts "[*] Running nuclei on #{target}..."
      system("nuclei -u #{target} -t #{template}")
    end
  end
end
