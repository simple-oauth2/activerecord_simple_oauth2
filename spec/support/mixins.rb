require File.expand_path('../../../lib/activerecord_simple_oauth2', __FILE__)

class Client < ApplicationRecord
  include ActiveRecord::Simple::OAuth2::Client
end

class AccessToken < ApplicationRecord
  include ActiveRecord::Simple::OAuth2::AccessToken
end

class AccessGrant < ApplicationRecord
  include ActiveRecord::Simple::OAuth2::AccessGrant
end

class User < ApplicationRecord
  include ActiveRecord::Simple::OAuth2::ResourceOwner
end
