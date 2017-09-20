class Training < ApplicationRecord
  paginates_per 4
  validates_presence_of :title, :body, :t_date, :length, :difficulty
  validates_numericality_of :length, :difficulty

  def start_time
    self.t_date
  end

  def self.date_monday(date)
    # date = date.is_a? String ? Date.parse(date) : date 
    if date.is_a? String
      date = Date.parse(date)
    elsif !date.is_a? Date 
      date = Date.parse('1.1.1900')
    end
    date = date - date.wday + 1
  end

  def self.weeksum(date, trainee_id)
    weeksum = 0
    trainee_trainings = self.where(user_id: trainee_id)
    
    date_monday = date_monday(date)
    for d in date_monday..date_monday+7
      if trainee_trainings.where(t_date: d)

        trainee_trainings.where(t_date: d).each do |t|
          weeksum += t.length
        end
      end
    end
    weeksum
  end
end
