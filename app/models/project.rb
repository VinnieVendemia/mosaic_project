class Project < ApplicationRecord
  paginates_per 20

  # not part of the requirements, just something to test against
  validates_presence_of :school_name
end
