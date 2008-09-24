class VideosController < ApplicationController
  layout "internal_standard"
     def index
       @videos = Video.find(:all)

       respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @video }
       end
     end

     def new
       @video = Video.new

       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @video }
       end
     end

     def edit
       @video = Video.find(params[:id])
     end

     def create
       @video = Video.new(params[:video])

       respond_to do |format|
         if @video.save
           flash[:notice] = 'Video was successfully created.'
           format.html { redirect_to videos_path }
           format.xml  { render :xml => @video, :status => :created, :location => @video }
         else
           format.html { render :action => "new" }
           format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
         end
       end
     end

     def update
       @video = Video.find(params[:id])

       respond_to do |format|
         if @video.update_attributes(params[:video])
           flash[:notice] = 'Video was successfully updated.'
           format.html { redirect_to videos_path }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
         end
       end
     end


     def destroy
       @video = Video.find(params[:id])
       @video.destroy

       respond_to do |format|
         format.html { redirect_to videos_path }
         format.xml  { head :ok }
       end
     end
   
end
