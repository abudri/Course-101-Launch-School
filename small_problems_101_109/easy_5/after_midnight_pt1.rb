
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = 1280

def time_of_day(minutes_change)
  minutes_change = minutes_change % MINUTES_PER_DAY
  hours, minutes = minutes_change.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end 

