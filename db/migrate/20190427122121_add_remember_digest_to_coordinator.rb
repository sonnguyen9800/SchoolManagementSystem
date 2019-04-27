class AddRememberDigestToCoordinator < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :remember_digest, :string
  end
end
