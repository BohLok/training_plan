class Training < ApplicationRecord
  paginates_per 4
  validates_presence_of :title, :body, :t_date, :length, :difficulty
end
