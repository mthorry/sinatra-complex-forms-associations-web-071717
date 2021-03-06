class OwnersController < ApplicationController

  get '/owners' do
    erb :'/owners/index'
  end


  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end


  post '/owners' do
    # params => {"owner"=>{"name"=>"Matt"}, "pet"=>{"id"=>"4", "name"=>"Mark"}}
    @owner = Owner.create(params[:owner])
      if !params["pet"]["name"].empty?
        @owner.pets << Pet.create(name: params["pet"]["name"])
      end

    @owner.save
    redirect "/owners/#{@owner.id}"
  end


  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end


  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end


  post '/owners/:id' do
   @owner = Owner.find_by(id: params[:id])
   @owner.update(params[:owner])

   if !params[:pet][:name].empty?
     @owner.pets << Pet.create(name: params[:pet][:name])
   end

   redirect "owners/#{@owner.id}"
  end

end