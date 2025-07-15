# Websploit Framework

> A modular offensive security framework for web application testing — written in Ruby, inspired by Metasploit.

## 🚀 Features

- Metasploit-style interface (`use`, `set`, `show options`, `run`)
- Module-based architecture for scanners, exploits, integrations
- Custom module support (easily create your own)
- Threaded enumeration
- External tool integration:
  - [x] Nuclei
  - [x] SQLMap
  - [x] Dirsearch

## 📦 Requirements

- Ruby >= 2.5
- Tools in `$PATH`:
  - `nuclei`
  - `sqlmap`
  - `dirsearch`

## 🛠️ Setup

```bash
git clone https://github.com/youruser/websploit.git
cd websploit
chmod +x websploit.rb
```

## 🧪 Usage

```bash
./websploit.rb
```

Then inside the console:

```bash
websploit > list
websploit > use scanner/dir_enum
websploit > set TARGET http://example.com
websploit > show options
websploit > run
```

## 📁 Modules

| Path                    | Description                            |
|-------------------------|----------------------------------------|
| scanner/dir_enum        | Directory brute-force with threads     |
| scanner/nuclei          | Nuclei scanner wrapper                 |
| scanner/sqlmap          | SQLMap wrapper                         |
| scanner/dirsearch       | Dirsearch wrapper                      |
| exploit/example_sql_injection | Demo SQLi checker (basic)        |

## 📦 Custom Modules

Create a `.rb` file in `modules/scanner/` or `modules/exploit/`:

```ruby
class MyCustom < Websploit::BaseModule
  path 'scanner/my_custom'

  register_option 'TARGET', default: 'http://localhost', required: true, description: 'Target URL'

  def run
    puts "Running on #{options['TARGET'][:current]}"
  end
end
```

