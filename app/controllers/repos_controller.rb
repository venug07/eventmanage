class ReposController < ApplicationController

   
   # POST /repos
   def create
    @repo = Repo.new(repo_params)
    if @repo.save
      render json: @repo.as_json, status: :created
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
   end

   private

   def repo_params
    params.require(:repo).permit(:name)
   end



end
