module CalendarsHelper
  def calendar(date = Date.today, & block)
    Calendar.new(self, date, block).table
  end
  
  def calendar_chores(date)
    @chores = @allactivities.where(:date => date)
    if !@chores.blank?
      if !@chores.where(:status => 1)
        1
      else  
        2
      end
    else
        3
    end
  end
end
