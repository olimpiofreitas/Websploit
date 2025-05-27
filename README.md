# Websploit Framework

Websploit Framework is a web security tool that integrates various popular pentesting tools into a unified interface, inspired by the Metasploit Framework.

## 🚀 Features

- Metasploit-style interface (`use`, `set`, `show options`, `run`)
- Module-based architecture for scanners, exploits, and integrations
- Custom module support
- External tool integration:
  - [x] Nuclei
  - [x] SQLMap
  - [x] Dirsearch
  - [x] And more...

## 📦 Requirements

### Normal Installation
- Ruby >= 2.5
- Tools in `$PATH`:
  - `nuclei`
  - `sqlmap`
  - `dirsearch`

### Docker Installation
- Docker
- Docker Compose (optional)

## 🛠️ Installation

### Method 1: Normal Installation

1. Clone the repository:
```bash
git clone https://github.com/Websploit/websploit.git
cd websploit
```

2. Install dependencies:
```bash
# Install Nuclei
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.9.4/nuclei_2.9.4_linux_amd64.zip
unzip nuclei_2.9.4_linux_amd64.zip
sudo mv nuclei /usr/local/bin/

# Install SQLMap
git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
sudo ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap

# Install Dirsearch
pip3 install dirsearch
```

3. Run the framework:
```bash
chmod +x websploit.rb
./websploit.rb
```

### Method 2: Docker Installation

1. Clone the repository:
```bash
git clone https://github.com/Websploit/websploit.git
cd websploit
```

2. Build the Docker image:
```bash
docker build -t websploit .
```

3. Run the container:
```bash
docker run -it --rm websploit
```

Or using Docker Compose:

1. Create a `docker-compose.yml` file:
```yaml
version: '3'
services:
  websploit:
    build: .
    volumes:
      - ./sessions:/app/sessions
    tty: true
    stdin_open: true
```

2. Run with Docker Compose:
```bash
docker-compose up
```

## 📁 Available Modules

### Scanner
- `scanner/nuclei` - Vulnerability scanner using Nuclei
- `scanner/dirsearch` - Directory scanner using Dirsearch
- `scanner/sqlmap` - SQL injection scanner using SQLMap
- `scanner/dir_enum` - Directory enumeration with threads

### Exploit
- `exploit/xss` - Cross-Site Scripting (XSS) testing
- `exploit/lfi` - Local File Inclusion (LFI) testing
- `exploit/ssrf` - Server-Side Request Forgery (SSRF) testing
- `exploit/xxe` - XML External Entity (XXE) testing
- `exploit/sql_injection` - SQL injection testing

### Auxiliary
- `auxiliary/port_scan` - Port scanner

### Post
- `post/shell_upload` - Shell upload

## 🎮 Usage

### Basic Commands
- `help` - Shows available commands
- `list` - Lists all available modules
- `use <module>` - Selects a module for use
- `set <option> <value>` - Sets an option value
- `show options` - Shows available options for current module
- `run` - Runs the selected module
- `save` - Saves current session
- `load` - Loads a saved session
- `exit` or `quit` - Exits the framework

### Usage Examples

1. Using Nuclei scanner:
```
websploit > use scanner/nuclei
websploit (scanner/nuclei) > set target http://example.com
websploit (scanner/nuclei) > set template cves/
websploit (scanner/nuclei) > run
```

2. Testing XSS:
```
websploit > use exploit/xss
websploit (exploit/xss) > set target http://example.com
websploit (exploit/xss) > set param search
websploit (exploit/xss) > run
```

3. Testing LFI:
```
websploit > use exploit/lfi
websploit (exploit/lfi) > set target http://example.com
websploit (exploit/lfi) > set param file
websploit (exploit/lfi) > run
```

## 📦 Custom Modules

Create a `.rb` file in `modules/scanner/` or `modules/exploit/`:

```ruby
require_relative '../../core/base_module'

module Websploit
  class MyCustom < Websploit::BaseModule
    path 'scanner/my_custom'

    register_option 'TARGET', default: 'http://localhost', required: true, description: 'Target URL'

    def run
      puts "Running on #{options['TARGET'][:current]}"
    end
  end
end
```

## 🔒 Saving Sessions

Sessions are saved in the `sessions/` directory inside the container. To persist sessions between runs, mount the volume as shown in the Docker Compose example above.

## ⚠️ Legal Notice

This tool is for **educational and authorized testing** purposes only. Use responsibly.

## 👥 Contributing

Contributions are welcome! Please feel free to submit pull requests.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.
