$:.push File.expand_path(File.join(File.dirname(__FILE__), 'geoscript'))

require 'java'

Dir.entries(File.join(File.expand_path(File.dirname(__FILE__)), 'geotools')).sort.each do |entry|
  if entry =~ /.jar$/
    $CLASSPATH << File.join(File.expand_path(File.dirname(__FILE__)), "/geotools/#{entry}")
  end
end

java_import org.geotools.factory.Hints

unless java.lang.System.get_property("org.geotools.referencing.forceXY") == "true"
  java.lang.System.set_property "org.geotools.referencing.forceXY", "true"
end
Hints.put_system_default Hints::FORCE_LONGITUDE_FIRST_AXIS_ORDER, java.lang.Boolean.new(true)

require 'geoscript/version'
require 'geoscript/util'
require 'geoscript/projection'
require 'geoscript/geom'