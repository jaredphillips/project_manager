class MassInvite < ActiveRecord::Base
  belongs_to :team
  has_many :invites
  
  accepts_nested_attributes_for :invites, reject_if: proc { |attributes| attributes['email'].blank? }, allow_destroy: true
end
