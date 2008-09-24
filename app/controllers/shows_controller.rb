class ShowsController < ApplicationController
  layout "internal_standard"
     def index
       @shows = Show.find(:all)

       respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @show }
       end
     end

     def new
       @show = Show.new

       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @show }
       end
     end

     def edit
       @show = Show.find(params[:id])
     end

     def create
       @show = Show.new(params[:show])

       respond_to do |format|
         if @show.save
           flash[:notice] = 'Show was successfully created.'
           format.html { redirect_to shows_path }
           format.xml  { render :xml => @show, :status => :created, :location => @show }
         else
           format.html { render :action => "new" }
           format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
         end
       end
     end

     def update
       @show = Show.find(params[:id])

       respond_to do |format|
         if @show.update_attributes(params[:show])
           flash[:notice] = 'Show was successfully updated.'
           format.html { redirect_to shows_path }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
         end
       end
     end


     def destroy
       @show = Show.find(params[:id])
       @show.destroy

       respond_to do |format|
         format.html { redirect_to shows_path }
         format.xml  { head :ok }
       end
     end
   
end
