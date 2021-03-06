class CreateApplicant < ActiveRecord::Migration
  def up
    create_table :applicants do |t|
      t.string :type
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :applicant_first_name
      t.string :applicant_last_name
      t.date :applicant_birth_date
      t.string :applicant_birth_place
      t.date :applicant_marriage_date
      t.string :applicant_marriage_place
      t.string :spouse_first_name
      t.string :spouse_last_name
      t.date :spouse_birth_date
      t.string :spouse_birth_place
      t.date :spouse_death_date
      t.string :spouse_death_place
      t.string :father_first_name
      t.string :father_last_name
      t.date :father_birth_date
      t.string :father_birth_place
      t.date :father_death_date
      t.string :father_death_place
      t.date :parents_marriage_date
      t.string :parents_marriage_place
      t.string :mother_first_name
      t.string :mother_last_name
      t.date :mother_birth_date
      t.string :mother_birth_place
      t.date :mother_death_date
      t.string :mother_death_place
      t.string :grandfather_first_name
      t.string :grandfather_last_name
      t.date :grandfather_birth_date
      t.string :grandfather_birth_place
      t.date :grandfather_death_date
      t.string :grandfather_death_place
      t.date :grandparents_marriage_date
      t.string :grandparents_marriage_place
      t.string :grandmother_first_name
      t.string :grandmother_last_name
      t.date :grandmother_birth_date
      t.string :grandmother_birth_place
      t.date :grandmother_death_date
      t.string :grandmother_death_place
      t.string :ancestor_1a_first_name
      t.string :ancestor_1a_last_name
      t.date :ancestor_1a_birth_date
      t.string :ancestor_1a_birth_place
      t.date :ancestor_1a_death_date
      t.string :ancestor_1a_death_place
      t.date :ancestor_1_marriage_date
      t.string :ancestor_1_marriage_place
      t.string :ancestor_1b_first_name
      t.string :ancestor_1b_last_name
      t.date :ancestor_1b_birth_date
      t.string :ancestor_1b_birth_place
      t.date :ancestor_1b_death_date
      t.string :ancestor_1b_death_place
      t.string :ancestor_2a_first_name
      t.string :ancestor_2a_last_name
      t.date :ancestor_2a_birth_date
      t.string :ancestor_2a_birth_place
      t.date :ancestor_2a_death_date
      t.string :ancestor_2a_death_place
      t.date :ancestor_2_marriage_date
      t.string :ancestor_2_marriage_place
      t.string :ancestor_2b_first_name
      t.string :ancestor_2b_last_name
      t.date :ancestor_2b_birth_date
      t.string :ancestor_2b_birth_place
      t.date :ancestor_2b_death_date
      t.string :ancestor_2b_death_place
      t.string :ancestor_3a_first_name
      t.string :ancestor_3a_last_name
      t.date :ancestor_3a_birth_date
      t.string :ancestor_3a_birth_place
      t.date :ancestor_3a_death_date
      t.string :ancestor_3a_death_place
      t.date :ancestor_3_marriage_date
      t.string :ancestor_3_marriage_place
      t.string :ancestor_3b_first_name
      t.string :ancestor_3b_last_name
      t.date :ancestor_3b_birth_date
      t.string :ancestor_3b_birth_place
      t.date :ancestor_3b_death_date
      t.string :ancestor_3b_death_place
      t.string :ancestor_4a_first_name
      t.string :ancestor_4a_last_name
      t.date :ancestor_4a_birth_date
      t.string :ancestor_4a_birth_place
      t.date :ancestor_4a_death_date
      t.string :ancestor_4a_death_place
      t.date :ancestor_4_marriage_date
      t.string :ancestor_4_marriage_place
      t.string :ancestor_4b_first_name
      t.string :ancestor_4b_last_name
      t.date :ancestor_4b_birth_date
      t.string :ancestor_4b_birth_place
      t.date :ancestor_4b_death_date
      t.string :ancestor_4b_death_place
      t.string :ancestor_5a_first_name
      t.string :ancestor_5a_last_name
      t.date :ancestor_5a_birth_date
      t.string :ancestor_5a_birth_place
      t.date :ancestor_5a_death_date
      t.string :ancestor_5a_death_place
      t.date :ancestor_5_marriage_date
      t.string :ancestor_5_marriage_place
      t.string :ancestor_5b_first_name
      t.string :ancestor_5b_last_name
      t.date :ancestor_5b_birth_date
      t.string :ancestor_5b_birth_place
      t.date :ancestor_5b_death_date
      t.string :ancestor_5b_death_place
    end
  end

  def down
    drop_table :applicants
  end
end
