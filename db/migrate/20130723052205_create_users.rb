class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :github_access_token
      t.string :github_id
      t.string :twitter_oauth_token
      t.string :twitter_oauth_token_secret
      t.string :twitter_id
      t.string :remember_me_token

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :github_access_token
    add_index :users, :github_id, unique: true
    add_index :users, :twitter_oauth_token
    add_index :users, :twitter_oauth_token_secret
    add_index :users, :twitter_id, unique: true
    add_index :users, :remember_me_token
  end
end
