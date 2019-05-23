class AddAdminflagToCoordinator < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :adminflag, :boolean

  end
end
