class CreateLinkedinOauthSettings < ActiveRecord::Migration
  def change
    create_table :linkedin_oauth_settings do |t|
      t.string :atoken, index: true
      t.string :asecret, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
