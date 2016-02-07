class GolemYardApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = golem_yard.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  get '/robots/:id' do |id|
    @robot = golem_yard.find(id.to_i)
    erb :show
  end

  post '/robots' do
    golem_yard.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id/edit' do |id|
    @robot = golem_yard.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    golem_yard.update(params[:robot], id.to_i)
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    golem_yard.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

  def golem_yard
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite("db/golem_yard_test.sqlite3")
    else
      database = Sequel.sqlite("db/golem_yard_development.sqlite3")
    end
    @golem_yard ||= GolemYard.new(database)
  end
end
