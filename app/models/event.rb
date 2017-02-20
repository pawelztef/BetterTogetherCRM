class Event < ActiveRecord::Base
  has_one :custom_event, dependent: :destroy
  has_one :visit, dependent: :destroy
  has_one :training, dependent: :destroy
  
  validates_presence_of :start, :end, :title

  accepts_nested_attributes_for :custom_event, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :visit, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :training, reject_if: :all_blank, allow_destroy: true
  
end
