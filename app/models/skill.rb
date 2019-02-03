class Skill < ApplicationRecord
  belongs_to :parent, class_name: "Skill", optional: true
  has_many :children, class_name: "Skill", foreign_key: "parent_id", :dependent => :destroy
  has_and_belongs_to_many :users

  scope :all_parents, -> { where(parent_id: nil) }
  scope :except_skill, -> (id) { where.not(id: id)  unless id.blank? }

  
  def skill_parents
  	if children.exists?
  		[]
    else
  	  Skill.all_parents.except_skill(id).collect {|sp| [ sp.name, sp.id ] }
    end
  end

end
