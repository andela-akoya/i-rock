class Achievement < ApplicationRecord
  validates_presence_of :title
  enum privacy: [:public_access, :private_access, :friends_access]
end
