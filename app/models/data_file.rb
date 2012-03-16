class DataFile < ActiveRecord::Base
  
    def self.save(upload)
      name =  upload['datafile'].original_filename
      #create the file path
      path = File.join('public/test', upload['datafile'].original_filename )
      #write the file
      File.open( path.to_s, 'w' ) do |file|
             file.write( upload['datafile'].read )
      end
    end
end
