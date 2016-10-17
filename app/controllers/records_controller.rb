class RecordsController < ApplicationController
  before_action :find_record, only: [:show, :edit, :update]

  def index
    # get all the records
    @records = Record.all
  end

  def show
  end

  def new
    # new instance of a record
    @record = Record.new
  end

  def create
    # creating a record in the database
    record = Record.create(record_params)
    redirect_to records_path
  end

  def edit
  end

  def update
    @record.update(record_params)
    redirect_to @record
  end

  def destroy
    Record.destroy(params[:id])
    redirect_to records_path
  end

  private

  # strong parameters for a record
  def record_params
    params.require(:record).permit(:title, :artist, :year, :cover_art, :song_count)
  end

  def find_record
    @record = Record.find(params[:id])
  end

end
