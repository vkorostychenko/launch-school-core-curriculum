=begin
Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

Complete this class so that the test cases shown below work as intended.
You are free to add any methods or instance variables you need. However, do not
make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+
=end

=begin
Further Exploration

Modify this class so 'new' will optionally let you specify a fixed banner width
at the time the Banner object is created. The message in the banner should be
centered within the banner of that width. Decide for yourself how you want
to handle widths that are either too narrow or too wide.
=end

class Banner
  def initialize(message, width=false)
    @message = message
    width ? @width = width : @width = @message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end
  
  def empty_line
    "| #{' ' * @width} |"
  end
  
  def message_line
    "| #{' ' * align}#{@message}#{' ' * align} |"
  end

  def align
    gap = @width - @message.size

    gap > 0 ? gap / 2 : gap
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner
# +------------------------------------------------------------------------------------------------------+
# |                                                                                                      |
# |                              To boldly go where no one has gone before.                              |
# |                                                                                                      |
# +------------------------------------------------------------------------------------------------------+
