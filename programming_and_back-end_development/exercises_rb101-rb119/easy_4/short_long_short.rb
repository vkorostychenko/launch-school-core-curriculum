def short_long_short(str1, str2)
  short = str1.length < str2.length ? str1 : str2
  long = str1.length > str2.length ? str1 : str2

  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
