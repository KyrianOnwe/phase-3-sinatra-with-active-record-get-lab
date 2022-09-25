class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'
  

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bake = Bakery.find(params[:id])
    bake.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    yum = BakedGood.all.order(price: :desc)
    yum.to_json
  end

  get '/baked_goods/most_expensive' do
    no = BakedGood.all.order(price: :desc).limit(1)
    no.to_json
  end

end
