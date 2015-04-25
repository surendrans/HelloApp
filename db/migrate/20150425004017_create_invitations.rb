class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.references :user, index: true, foreign_key: true
      t.datetime :invitation_date
      t.string :purpose
      t.string :qr_code_url

      t.timestamps null: false
    end
  end
end
