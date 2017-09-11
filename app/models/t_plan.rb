class T_Plan < ApplicationRecord

  def start_time
    self.training.t_date
  end
end