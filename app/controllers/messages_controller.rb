class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
     
    @message = current_user.messages.build(params[:message])
    if @message.save
      
      
      @account_sid = 'ACdb43c99b5deb7d4ed12083140f41bab3'
      @auth_token = '11dbb8cbba9b004652469aa77e51183c'

      # set up a client to talk to the Twilio REST API
      @client = Twilio::REST::Client.new(@account_sid, @auth_token)
      ha = HashWithIndifferentAccess.new(params[:message])
      mssg = ha['content']

      friends = {
        "+14159006499" => "Jered",
        "+11111111111" => "Chris",
        "+11111111111" => "Kathryn"}

      @account = @client.account
      @message = @account.sms.messages.create({:to => '+14159006499', :from => '+18319204556', :body => mssg})
      puts @message
      flash[:success] = "Message created!"
      redirect_to 'http://www.bugl.co/acknowledge.html'

    else
      @feed_items = []
      render 'static_pages/home'
    end
  
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        
        format.json { render json: @message, status: :created, location: @message }
      else
        
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
