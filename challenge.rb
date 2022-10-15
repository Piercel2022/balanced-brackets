
def balanced_brackets?(string)
  # your code here
  return false if string.length.odd?
  return false if string =~ /[^\[\]\(\)\{\}]/

  pairs = { '{' => '}', '[' => ']', '(' => ')' }

  stack = []
  string.chars do |bracket|
    if expectation = pairs[bracket]
      stack << expectation
    else
      return false unless stack.pop == bracket
    end
  end

  stack.empty?
end

puts balanced_brackets?('(hello)[world]')
# => true

puts balanced_brackets?('([)]')
# => false

puts balanced_brackets?('[({}{}{})([])]')
# => true
