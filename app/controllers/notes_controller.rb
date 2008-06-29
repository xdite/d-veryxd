require 'twitter'
class NotesController < ApplicationController


  def index
    @notes = Note.latest.paginate :page => params[:page], :per_page => 10
    @notes = Note.hotest.paginate :page => params[:page], :per_page => 10 if params[:list] == "hot" 

    respond_to do |format|
       format.html
       format.rss 
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(params[:note])
    if @note.save
     begin
       Twitter::Base.new('desbot@veryxd.net', 'des123').post("絕望啦！我對『#{@note.content}』絕望啦！ by #{@note.nickname}" )
     rescue
     end
      redirect_to notes_path
    else
      redirect_to new_note_path
    end
  end

  def pick
    @note = Note.pick
    render :template => "notes/show"
  end
end
