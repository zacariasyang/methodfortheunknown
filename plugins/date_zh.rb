class Date
  DAYNAMES =  %w(星期日 星期一 星期二 星期三 星期四 星期五 星期六)
  ABBR_DAYNAMES = %w(日 一 二 三 四 五 六)
end
class Time
  alias :strftime_nolocale :strftime

  def strftime(format)
    format = format.dup
    format.gsub!(/%a/, Date::ABBR_DAYNAMES[self.wday])
    format.gsub!(/%A/, Date::DAYNAMES[self.wday])
    self.strftime_nolocale(format)
  end
end
