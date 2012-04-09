class ContactController < ApplicationController	
  layout :except => [:index]
	def new
		 @ticket = Ticket.new
	end

  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.time = Time.now
    @ticket.define_id = 1
    respond_to do |format|
      if @ticket.save
        UserMailer.confirm(@ticket).deliver
        format.html { redirect_to({:action => "new"}, notice: t("helpers.notice.new"))}
      else
        format.html { render action: "new" }
      end
    end
  end
end
