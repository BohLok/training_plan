class Training < ApplicationRecord
  paginates_per 4
  validates_presence_of :title, :body, :t_date, :length, :difficulty
  validates_numericality_of :length, :difficulty

  def start_time
    self.t_date
  end

  def date_monday(date)
    date = date.is_a? String ? Date.parse date : date 
    date = date - date.wday + 1
  end

  def weeksum(date, trainee_id)
    weeksum = 0
    trainee_traing = self.find_by_user_id(trainee_id)
    date_monday = date_monday(date)
    for d in date_monday..date_monday+7
      trainee_traing.find_by_t_date(d).each do |t|
        weeksum += t.length
      end
    end
    weeksum
  end
end
