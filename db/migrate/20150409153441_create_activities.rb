class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.attachment :image

      t.timestamps null: false
    end
  end
end
