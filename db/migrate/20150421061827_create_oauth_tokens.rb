class CreateOauthTokens < ActiveRecord::Migration
  def change
    create_table :oauth_tokens do |t|
      t.string :secret_key
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
