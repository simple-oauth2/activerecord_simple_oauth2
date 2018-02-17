module ActiveRecord
  module Simple
    module OAuth2
      # Client role mixin for ActiveRecord.
      # Includes all the required API, associations, validations and callbacks.
      module Client
        extend ActiveSupport::Concern

        included do
          # Returns associated AccessToken array.
          #
          # @return [Array<Object>] AccessToken array.
          #
          has_many :access_tokens, class_name: ::Simple::OAuth2.config.access_token_class_name,
                                   foreign_key: :client_id,
                                   dependent: :destroy

          # Returns associated AccessGrant array.
          #
          # @return [Array<Object>] AccessGrant array.
          #
          has_many :access_grants, class_name: ::Simple::OAuth2.config.access_grant_class_name, foreign_key: :client_id

          # Required fields!
          validates :key, :secret, presence: true, uniqueness: true

          # Generate tokens
          before_validation :generate_tokens, on: :create

          # Searches for Client record with the specific `#key` value.
          #
          # @param key [#to_s] key value (any object that responds to `#to_s`).
          #
          # @return [Object, nil] Client object or nil if there is no record with such `#key`.
          #
          def self.by_key(key)
            where(key: key.to_s).first
          end

          private

          # Generate tokens
          #
          # @return token [String] string object.
          # @return refresh_token [String] string object.
          #
          def generate_tokens
            self.key = ::Simple::OAuth2::UniqToken.generate if key.blank?
            self.secret = ::Simple::OAuth2::UniqToken.generate if secret.blank?
          end
        end
      end
    end
  end
end
