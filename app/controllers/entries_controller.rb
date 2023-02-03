class EntriesController < ApplicationController
  require 'csv'
  before_action :require_login

  def import
    file = params[:file]

    return redirect_to '/entries', notice: 'Only CSV files are accepted' unless file.content_type == 'text/csv'

    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      song_hash = {}
      song_hash[:song_title] = row['Title']
      song_hash[:year] = row['Year']
      song_hash[:composer] = row['Composer']
      song_hash[:key] = row['Key(s)']
      song_hash[:video_url] = row['VideoLink']
      Entry.create(song_hash)
    end

    redirect_to '/entries', notice: 'Songs imported'
  end

  def index
    @q = Entry.ransack(params[:q])
    @entries = @q.result
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to '/entries'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])

    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entry_path, status: :see_other
  end

  private

  def require_login
    return if current_user

    flash[:error] = 'You must be logged in to view this page'
    redirect_to '/'
  end

  def entry_params
    params.require(:entry).permit(:song_title, :year, :composer, :key, :video_url, :learning)
  end
end
