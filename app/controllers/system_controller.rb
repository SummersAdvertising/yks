class SystemController < ApplicationController
  def content
   filewhere = "public"
   filewhere = File.join(filewhere, params["id"].to_s + '.html')
   file = open (filewhere)
   @text = file.read
   file.close
  end
end
