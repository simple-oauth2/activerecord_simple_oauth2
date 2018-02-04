class CreateSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :encrypted_password, null: false

      t.timestamps null: false
    end

    create_table :clients do |t|
      t.string :name, null: false
      t.string :redirect_uri, null: false
      t.string :key, null: false, unique: true, index: true
      t.string :secret, null: false, unique: true, index: true

      t.timestamps null: false
    end

    create_table :access_tokens do |t|
      t.integer :resource_owner_id, null: false, index: true
      t.integer :client_id, null: false, index: true

      t.string :token, null: false, unique: true, index: true
      t.string :refresh_token, unique: true, index: true
      t.string :scopes

      t.datetime :revoked_at
      t.datetime :expires_at, null: false

      t.timestamps null: false
    end

    create_table :access_grants do |t|
      t.integer :resource_owner_id, null: false, index: true
      t.integer :client_id, null: false, index: true

      t.string :token, null: false, unique: true, index: true
      t.string :redirect_uri, null: false
      t.string :scopes

      t.datetime :revoked_at
      t.datetime :expires_at, null: false

      t.timestamps null: false
    end
  end
end
