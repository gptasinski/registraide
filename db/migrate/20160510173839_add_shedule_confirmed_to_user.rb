class AddSheduleConfirmedToUser < ActiveRecord::Migration
  def change
    add_column :users, :schedule_confirmed, :boolean, default: false
  end
end
