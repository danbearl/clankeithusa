class Applicant
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :address, :city, :state, :zip, :email, 
                :applicant_first_name, :applicant_last_name, :applicant_birth_date, :applicant_birth_place, 
                :applicant_marriage_date, :applicant_marriage_place, 
                :spouse_first_name, :spouse_last_name, :spouse_birth_date, 
                :spouse_birth_place, :spouse_death_date, :spouse_death_place, 
                :father_first_name, :father_last_name, :father_birth_date, 
                :father_birth_place, :father_death_date, :father_death_place, 
                :parents_marriage_date, :parents_marriage_place, 
                :mother_first_name, :mother_last_name, :mother_birth_date, 
                :mother_birth_place, :mother_death_date, :mother_death_place, 
                :p_grandfather_first_name, :p_grandfather_last_name, :p_grandfather_birth_date, 
                :p_grandfather_birth_place, :p_grandfather_death_date, :p_grandfather_death_place, 
                :p_grandparents_marriage_date, :p_grandparents_marriage_place, 
                :p_grandmother_first_name, :p_grandmother_last_name, :p_grandmother_birth_date, 
                :p_grandmother_birth_place, :p_grandmother_death_date, :p_grandmother_death_place,
                :m_grandfather_first_name, :m_grandfather_last_name, :m_grandfather_birth_date, 
                :m_grandfather_birth_place, :m_grandfather_death_date, :m_grandfather_death_place, 
                :m_grandparents_marriage_date, :m_grandparents_marriage_place, 
                :m_grandmother_first_name, :m_grandmother_last_name, :m_grandmother_birth_date, 
                :m_grandmother_birth_place, :m_grandmother_death_date, :m_grandmother_death_place,
                :ancestor_1a_first_name, :ancestor_1a_last_name, :ancestor_1a_birth_date, 
                :ancestor_1a_birth_place, :ancestor_1a_death_date, :ancestor_1a_death_place, 
                :ancestor_1_marriage_date, :ancestor_1_marriage_place, 
                :ancestor_1b_first_name, :ancestor_1b_last_name, :ancestor_1b_birth_date, 
                :ancestor_1b_birth_place, :ancestor_1b_death_date, :ancestor_1b_death_place,
                :ancestor_2a_first_name, :ancestor_2a_last_name, :ancestor_2a_birth_date, 
                :ancestor_2a_birth_place, :ancestor_2a_death_date, :ancestor_2a_death_place, 
                :ancestor_2_marriage_date, :ancestor_2_marriage_place, 
                :ancestor_2b_first_name, :ancestor_2b_last_name, :ancestor_2b_birth_date, 
                :ancestor_2b_birth_place, :ancestor_2b_death_date, :ancestor_2b_death_place,
                :ancestor_3a_first_name, :ancestor_3a_last_name, :ancestor_3a_birth_date, 
                :ancestor_3a_birth_place, :ancestor_3a_death_date, :ancestor_3a_death_place, 
                :ancestor_3_marriage_date, :ancestor_3_marriage_place, 
                :ancestor_3b_first_name, :ancestor_3b_last_name, :ancestor_3b_birth_date, 
                :ancestor_3b_birth_place, :ancestor_3b_death_date, :ancestor_3b_death_place,
                :ancestor_4a_first_name, :ancestor_4a_last_name, :ancestor_4a_birth_date, 
                :ancestor_4a_birth_place, :ancestor_4a_death_date, :ancestor_4a_death_place, 
                :ancestor_4_marriage_date, :ancestor_4_marriage_place, 
                :ancestor_4b_first_name, :ancestor_4b_last_name, :ancestor_4b_birth_date, 
                :ancestor_4b_birth_place, :ancestor_4b_death_date, :ancestor_4b_death_place,
                :ancestor_5a_first_name, :ancestor_5a_last_name, :ancestor_5a_birth_date, 
                :ancestor_5a_birth_place, :ancestor_5a_death_date, :ancestor_5a_death_place, 
                :ancestor_5_marriage_date, :ancestor_5_marriage_place, 
                :ancestor_5b_first_name, :ancestor_5b_last_name, :ancestor_5b_birth_date, 
                :ancestor_5b_birth_place, :ancestor_5b_death_date, :ancestor_5b_death_place

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
