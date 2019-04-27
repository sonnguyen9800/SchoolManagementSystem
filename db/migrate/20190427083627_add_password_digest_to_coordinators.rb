class AddPasswordDigestToCoordinators < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :password_digest, :string
  end
end
