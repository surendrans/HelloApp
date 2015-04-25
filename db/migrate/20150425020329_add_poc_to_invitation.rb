class AddPocToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :poc, :string
  end
end
