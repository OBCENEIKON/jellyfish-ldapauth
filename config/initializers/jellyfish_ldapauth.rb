Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ldap,
            title: ENV['LDAP_TITLE'] || nil,
            host: ENV['LDAP_HOST'] || nil,
            port: ENV['LDAP_PORT'] || nil,

            # Can be :plain or :ssl
            method: ENV['LDAP_METHOD'] || nil,

            # :base => 'dc=intridea, dc=com'
            base: ENV['LDAP_BASE'] || nil,

            # :uid => 'sAMAccountName'
            uid: ENV['LDAP_UID'] || nil,

            # :bind_dn => 'default_bind_dn',
            bind_dn: ENV['LDAP_BIND_DN'] || nil,
            password: ENV['LDAP_PASSWORD'] || nil,

            # :name_proc => Proc.new {|name| name.gsub(/@.*$/,'')},
            name_proc: ENV['LDAP_NAME_PROC'] || Proc.new {|name| name.gsub(/@.*$/,'')},

            # Or, alternatively:
            # :filter => '(&(uid=%{username})(memberOf=cn=myapp-users,ou=groups,dc=example,dc=com))'
            filter: ENV['LDAP_FILTER'] || nil,

            # This needs to be here for the devise scope
            path_prefix: '/api/v1/staff/auth'
end
