class Arnold::TargetGroup < Arnold::Model
  belongs_to :feature
  validates_presence_of :feature
end
