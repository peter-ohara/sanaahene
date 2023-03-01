
Time::DATE_FORMATS[:short_with_meridian] = "%d %b %I:%M %p"
Time::DATE_FORMATS[:long_with_meridian] = "%B %d, %Y %I:%M %p"
Time::DATE_FORMATS[:time_only_with_meridian] = "%I:%M %p"
Time::DATE_FORMATS[:time_only] = "%H:%M"
# Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }