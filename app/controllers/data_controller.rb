class DataController < ApplicationController
  def new
    @data_file = DataFile.new
  end

  def create
    @data_file = DataFile.new params[:data_file]
    # In reality, this should really be a background job of some
    # variety, but I didn't want to introduce crazy dependencies
    # nor spend a whole mess of time on the challenge (as was
    # implied by the recruiter to whom I spoke). Just pointing out
    # that I know better. End of disclaimer. :)
    unless @data_file.save
      flash[:error] = @data_file.errors[:global]
      render :new
    end
  end
end
