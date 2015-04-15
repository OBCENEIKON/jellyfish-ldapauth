$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'jellyfish_ldapauth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'jellyfish-ldapauth'
  s.version     = JellyfishLdapauth::VERSION
  s.authors     = ['Jerimiah Milton']
  s.email       = ['milton_jerimiah@bah.com']
  s.homepage    = 'http://www.projectjellyfish.org/'
  s.summary     = 'Jellyfish LDAP Authentication'
  s.description = 'An LDAP Authentication method for Project Jellyfish'
  s.license     = 'APACHE'

  s.files = Dir['{config,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails'
  s.add_runtime_dependency 'dotenv-rails'
  s.add_runtime_dependency 'devise'
  s.add_runtime_dependency 'omniauth'
  s.add_runtime_dependency 'omniauth-ldap'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
end
