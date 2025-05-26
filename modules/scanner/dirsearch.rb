module Websploit
  class DirsearchScan < Websploit::BaseModule
    path 'scanner/dirsearch'

    register_option 'TARGET', default: '', required: true, description: 'Target URL'
    register_option 'WORDLIST', default: '/usr/share/wordlists/dirb/common.txt', required: false, description: 'Wordlist path'

    def run
      target = options["TARGET"][:current]
      wordlist = options["WORDLIST"][:current]
      puts "[*] Running dirsearch..."
      system("dirsearch -u \"#{target}\" -w #{wordlist}")
    end
  end
end

