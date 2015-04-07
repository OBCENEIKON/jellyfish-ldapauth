require 'rails/generators'
require 'rails/generators/active_record'

class JellyfishLdapauthGenerator < ActiveRecord::Generators::Base
  # ActiveRecord::Generators::Base inherits from Rails::Generators::NamedBase which requires a NAME parameter for the
  # new table name. Our generator always uses 'authentication', so we just set a random name here.
  argument :name, type: :string, default: 'random_name'

  class_option :'skip-migration', type: :boolean, desc: 'Don\'t generate a migration for the slugs table'

  source_root File.expand_path('../../jellyfish_ldapauth', __FILE__)

  # Copies the migration template to db/migrate.
  def copy_files
    return if options['skip-migration']
    migration_template 'migration.rb', 'db/migrate/create_authentications.rb'
  end
end
