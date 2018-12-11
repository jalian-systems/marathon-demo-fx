#{{{ Marathon
require_fixture 'default'
#}}} Marathon

name("Empty Test Case")
description("Test Case to check java version")
severity("normal")

def test
  
  # Prints the Java version on the Output tab.
  puts "Java Version = " + System.get_property('java.version')

end
