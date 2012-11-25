class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.json
  def index
    @project=Project.find(params[:project_id])
    @issues = @project.issues
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])
    #@issue = Issue.new(params[:issue])
    @issue.save
    redirect_to issues_path


    #respond_to do |format|
      #if @issue.save
        #format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        #format.json { render json: @issue, status: :created, location: @issue }
      #else
        #format.html { render action: "new" }
        #format.json { render json: @issue.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])
    @issue.update_attributes(params[:issue])
    redirect_to issues_path


  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end
end
