class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.xml
  def index
    @professors = Professor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @professors }
    end
  end

  # GET /professors/1
  # GET /professors/1.xml
  def show
    @professor = Professor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/new
  # GET /professors/new.xml
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.xml
  def create
    @professor = Professor.new(params[:professor])

    respond_to do |format|
      if @professor.save
        format.html { redirect_to(@professor, :notice => 'Professor was successfully created.') }
        format.xml  { render :xml => @professor, :status => :created, :location => @professor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def school_search
    @professor_name = '%' + params[:term] + '%'
    #TODO: Refine this query a bit, its bulky
    @professors = Professor.includes(:department).find(:all, :conditions => ["departments.school_id = ? AND (firstname LIKE ? OR lastname LIKE ?)",params[:school_id],@professor_name,@professor_name])
    @professor_array = []
    @professors.each do |professor|
      @professor_array << {"label" => professor.title + " " + professor.firstname + " " + professor.lastname, "value" => professor.id}
    end
    render :json => @professor_array
  end
  
  def course_search
    @professor = Professor.find(params[:professor_id])
    @course_name = '%' + params[:term] + '%'
    @courses = @professor.courses #.find(:all, :conditions => ["courses.name LIKE ?", @course_name]) 
    @course_array = []
    @courses.each do |course|
      @course_array << course.department.abbreviation + " #{course.number} - " + course.name
    end
    render :json => @course_array
  end  
  
  def tag_search
    @tag_cloud = Professor.tag_counts_on(:professor_ratings)
    @tag_array = []
    regex = Regexp.new("^" + Regexp.escape(params[:term]) + "(.)")
    @tag_cloud.each do |tag|
      if regex.match(tag.name)
        @tag_array << tag.name
      end
    end
    render :json => @tag_array
  end
  
  # PUT /professors/1
  # PUT /professors/1.xml
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_attributes(params[:professor])
        format.html { redirect_to(@professor, :notice => 'Professor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.xml
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to(professors_url) }
      format.xml  { head :ok }
    end
  end
end
