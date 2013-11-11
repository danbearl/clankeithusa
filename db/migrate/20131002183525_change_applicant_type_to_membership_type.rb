class ChangeApplicantTypeToMembershipType < ActiveRecord::Migration
  def change
    change_table :applicants do |t|
      t.rename :type, :membership_type
    end
  end
end
