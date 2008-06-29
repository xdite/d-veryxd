class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table (:notes,:options => 'DEFAULT CHARSET=UTF8') do |t|
      t.column :content, :string
      t.column :nickname, :string
      t.column :user_id, :integer
      t.column :points, :integer, :default  => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
