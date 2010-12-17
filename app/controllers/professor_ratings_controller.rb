class ProfessorRatingsController < ApplicationController
  #before_filter :authenticate_user!
  # GET /professor_ratings
  # GET /professor_ratings.xml
  def index
    @professor_ratings = ProfessorRating.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @professor_ratings }
    end
  end

  # GET /professor_ratings/1
  # GET /professor_ratings/1.xml
  def show
    @professor_rating = ProfessorRating.find(params[:id])
    #@tags = ProfessorRating.tag_counts_on(:tags)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @professor_rating }
    end
  end

  # GET /professor_ratings/new
  # GET /professor_ratings/new.xml
  def new
    @professor_rating = ProfessorRating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @professor_rating }
    end
  end

  # GET /professor_ratings/1/edit
  def edit
    @professor_rating = ProfessorRating.find(params[:id])
  end

  # POST /professor_ratings
  # POST /professor_ratings.xml
  def create
    @professor_rating = ProfessorRating.new(params[:rating_form])
    if @professor_rating.professor and params[:item]
      @professor_rating.tag(@professor_rating.professor, :with => params[:item][:tags].join(', '), :on => :tags)
    end
    #if @professor_rating.valid?
    respond_to do |format|
      if @professor_rating.save
       format.html { render :partial => "professors/rating_block", :layout => false, :object => @professor_rating, :as => :rating }
      # format.html { redirect_to(@professor_rating, :notice => 'Professor rating was successfully created.') }
       format.xml  { render :xml => @professor_rating, :status => :created, :location => @professor_rating }
      else
        #format.html { render :action => "new" }
        format.json  { render :json => @professor_rating.errors, :status => :unprocessable_entity }
        #format.js { render :action => 'rate_professor' }
      end
    end
  end

  # PUT /professor_ratings/1
  # PUT /professor_ratings/1.xml
  def update
    @professor_rating = ProfessorRating.find(params[:id])

    respond_to do |format|
      if @professor_rating.update_attributes(params[:professor_rating])
        @professor_rating.tag(@professor_rating.professor, :with => params[:professor][:tag_list], :on => :professor_ratings)
        format.html { redirect_to(@professor_rating, :notice => 'Professor rating was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @professor_rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_ratings/1
  # DELETE /professor_ratings/1.xml
  def destroy
    @professor_rating = ProfessorRating.find(params[:id])
    @professor_rating.destroy

    respond_to do |format|
      format.html { redirect_to(professor_ratings_url) }
      format.xml  { head :ok }
    end
  end
end
