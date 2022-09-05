class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add route
  get '/bakeries' do
    #get all the bakeries from the database
    bakeries = Bakery.all
    #send them back to json as arrays
    bakeries.to_json
    
  end
 
  get './bakeries/:id' do
    bakeries = Bakery.find(params[:id])

    bakeries.to_json(include: :baked_goods) 
  end

  get './baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get './baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
    
  end

end
