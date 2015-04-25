class AddCodeToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :code, :string
  end
end
