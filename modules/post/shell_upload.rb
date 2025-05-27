require_relative '../../core/base_module'

module Websploit
  class ShellUpload < Websploit::BaseModule
    path 'post/shell_upload'

    register_option 'TARGET', default: '', required: true, description: 'Target URL'
    register_option 'SHELL', default: 'php', required: false, description: 'Shell type (php/asp/jsp)'
    register_option 'PATH', default: '/uploads', required: false, description: 'Upload path'

    def run
      target = options["TARGET"][:current]
      shell = options["SHELL"][:current]
      path = options["PATH"][:current]

      puts "[*] Uploading #{shell} shell to #{target}"
      puts "[*] Path: #{path}"
      # Implementação do upload aqui
    end
  end
end 