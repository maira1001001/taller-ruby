class AnError < StandardError; end

def testException(arg)
  raise AnError if arg.nil?
  puts "arg no es nil. No se levanta la excepcion"
end

begin
  testException(nil)
rescue AnError
  p "Ocurrio que el string era nil"
end
