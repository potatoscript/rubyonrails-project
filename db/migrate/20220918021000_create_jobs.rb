class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :employee
      t.string :department
      t.string :job
      t.string :status

      t.timestamps
    end
  end
end
