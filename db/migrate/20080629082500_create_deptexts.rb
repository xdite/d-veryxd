class CreateDeptexts < ActiveRecord::Migration
  def self.up
    create_table :deptexts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :deptexts
  end
end
