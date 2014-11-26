class Selection < ActiveRecord::Base
  # Attributes name, select_type, user_created

  validates_uniqueness_of :name, scope: [:select_type]

  has_many :hazard_selects, class_name: 'Hazard', foreign_key: :hazard_select_id

  has_many :locking_selects, class_name: 'Theft', foreign_key: :locking_select_id
  has_many :locking_defeat_selects, class_name: 'Theft', foreign_key: :locking_defeat_select_id

  has_many :condition_selects, class_name: 'Crash', foreign_key: :condition_select_id
  has_many :location_selects, class_name: 'Crash', foreign_key: :location_select_id
  has_many :crash_selects, class_name: 'Crash', foreign_key: :crash_select_id
  has_many :vehicle_selects, class_name: 'Crash', foreign_key: :vehicle_select_id
  has_many :geometry_selects, class_name: 'Crash', foreign_key: :geometry_select_id

  has_many :lighting_selects, class_name: 'Crash', foreign_key: :lighting_select_id
  has_many :visibility_selects, class_name: 'Crash', foreign_key: :visibility_select_id
  has_many :injury_severity_selects, class_name: 'Crash', foreign_key: :injury_severity_select_id

  has_many :incident_experience_level_selects, class_name: 'Incident', foreign_key: :experience_level_select_id
  has_many :incident_gender_selects, class_name: 'Incident', foreign_key: :experience_level_select_id

  scope :default, -> { where(user_created: false) }
  scope :user_created, -> { where(user_created: true) }

  scope :hazards, -> { where(select_type: 'hazard') }
  scope :lockings, -> { where(select_type: 'locking') }
  scope :locking_defeats, -> { where(select_type: 'locking_defeat') }
  scope :conditions, -> { where(select_type: 'condition') }
  scope :locations, -> { where(select_type: 'location') }
  scope :crashs, -> { where(select_type: 'crash') }
  scope :vehicles, -> { where(select_type: 'vehicle') }
  scope :lighting, -> { where(select_type: 'lighting') }
  scope :visibility, -> { where(select_type: 'visibility') }
  scope :injury_severity, -> { where(select_type: 'injury_severity') }
  scope :experience_level, -> { where(select_type: 'experience_level') }
  scope :gender, -> { where(select_type: 'gender') }
      
end
