class AddApprovalsToApplicants < ActiveRecord::Migration
  def change
    change_table :applicants do |t|
      t.boolean :processed
      t.boolean :approved
    end
  end
end
