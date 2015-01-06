require 'prime'

if (ARGV.length == 0 || ARGV.length > 2) then
  print "Make a listing of continuous prime days.\n"
  print "Usage: #{$0} <year>\n"
  print "Usage: #{$0} <from_year> <to_year>\n"
  exit 1
end

if ARGV.length == 1 then
  from_year = to_year = ARGV[0].to_i
else
  from_year = ARGV[0].to_i
  to_year = ARGV[1].to_i
end

if (from_year < 1) || (to_year < 1) then
  print "Years must be more than 0.\n"
  exit 1
end

(from_year .. to_year).each do |year|
  if (year % 400 == 0) || (year % 100 != 0) && (year % 4 == 0) then
    days = [[131,201], [229,301], [331,401], [531,601], [731,801], [831,901], [1031, 1101]]
  else
    days = [[131,201], [331,401], [531,601], [731,801], [831,901], [1031, 1101]]
  end
  days.each do |day|
    day1 = year * 10000 + day[0]
    day2 = year * 10000 + day[1]
    if day1.prime? and day2.prime? then
      print "#{day1} and #{day2} are prime numbers.\n"
    end
  end
  day1 = year * 10000 + 1231
  day2 = (year+1) * 10000 + 101
  if day1.prime? and day2.prime? then
    print "#{day1} and #{day2} are prime numbers.\n"
  end
end
