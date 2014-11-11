def read_handling_exception(path)
  file = File.open(path)
  file.each do |line|
    p line
  end
rescue Errno::ENOENT =>e
  p e.message
end


def read_with_method_file(path) 
  if File.exists?(path)
    file = File.open(path)
    file.each do |line|
      p line
    end
  end
end



read_handling_exception("maii")
#read_handling_exception("/etc/cups/cupsd.conf")

#read_with_method_file("nadaaaa")
#read_handling_exception("/etc/apport/crashdb.conf.d/unity-crashdb.conf")
