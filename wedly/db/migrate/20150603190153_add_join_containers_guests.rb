class AddJoinContainersGuests < ActiveRecord::Migration
  def change
    create_table :guests_containers do |t|
      t.belongs_to :guest
      t.belongs_to :container
    end
  end
end
