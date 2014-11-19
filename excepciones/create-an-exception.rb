class AnError < StandardError
end

def testException(arg)
  raise AnError, "arg is Nil !!!" if arg.nil?
  puts "arg is not Nil. So, there is no exception to raise"
end

begin
  testException(nil)
rescue AnError => details
  p "The message of the exception : #{details}"
end
