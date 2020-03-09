require "sinatra/base"
require "erb"
require "lisbn"

class App < Sinatra::Base
  include ERB::Util
  get "/" do
    erb :index
  end
  post "/" do
    @isbns = []
    params["isbns"].split(/\n/).each do |line|
      line.chomp!
      isbn = Lisbn.new(line)
      @isbns << [line, isbn.valid?]
    end
    erb :index
  end
  run! if $0 == __FILE__
end
