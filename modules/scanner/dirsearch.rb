module Websploit
  class DirsearchScanner < WebModule
    def initialize
      super
      @name = "Dirsearch Scanner"
      @description = "Scan for directories and files using dirsearch"
      @options = {
        "TARGET" => "",
        "EXTENSIONS" => "php,html,js"
      }
    end

    def run
      target = get_option("TARGET")
      extensions = get_option("EXTENSIONS")
      if target.empty?
        puts "[!] TARGET não definido"
        return
      end

      cmd = "python3 /opt/dirsearch/dirsearch.py -u #{target} -e #{extensions}"
      puts "[*] Executando: #{cmd}"
      system(cmd)
    end
  end
end

