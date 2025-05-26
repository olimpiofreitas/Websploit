require_relative '../../core/web_module'

module Websploit
  class SqlmapScanner < WebModule
    def initialize
      super
      @name = "SQLMap Scanner"
      @description = "Detecta e explora injeções SQL com sqlmap"
      @options = {
        "TARGET" => "",
        "PARAM" => "id"
      }
    end

    def run
      target = get_option("TARGET")
      param = get_option("PARAM")

      if target.empty?
        puts "[!] TARGET não definido"
        return
      end

      cmd = "sqlmap -u \"#{target}?#{param}=1\" --batch --banner"
      puts "[*] Executando: #{cmd}"
      system(cmd)
    end
  end
end

