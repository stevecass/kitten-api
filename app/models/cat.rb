class Cat < ActiveRecord::Base
  belongs_to :breed
  delegate :name, to: :breed, prefix: true, allow_nil: true
end
