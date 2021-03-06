require 'rake/clean'
require 'rake/extensioncompiler'

# download mysql library and headers
directory "vendor"

file "vendor/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32.zip" => ["vendor"] do |t|
  url = "http://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32.zip/from/#{CONNECTOR_MIRROR}/"
  when_writing "downloading #{t.name}" do
    cd File.dirname(t.name) do
      sh "wget -c #{url} || curl -C - -O #{url}"
    end
  end
end

file "vendor/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32/include/mysql.h" => ["vendor/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32.zip"] do |t|
  full_file = File.expand_path(t.prerequisites.last)
  when_writing "creating #{t.name}" do
    cd "vendor" do
      sh "unzip #{full_file} mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32/bin/** mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32/include/** mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32/lib/**"
    end
    # update file timestamp to avoid Rake perform this extraction again.
    touch t.name
  end
end

# clobber expanded packages
CLOBBER.include("vendor/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32")

# vendor:mysql
task 'vendor:mysql' => ["vendor/mysql-connector-c-noinstall-#{CONNECTOR_VERSION}-win32/include/mysql.h"]

# hook into cross compilation vendored mysql dependency
if RUBY_PLATFORM =~ /mingw|mswin/ then
  Rake::Task['compile'].prerequisites.unshift 'vendor:mysql'
else
  if Rake::Task.tasks.map {|t| t.name }.include? 'cross'
    Rake::Task['cross'].prerequisites.unshift 'vendor:mysql'
  end
end
