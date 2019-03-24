require 'bundler/setup'
Bundler.require

require 'active_record'
require 'rake'

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DBRegistry[ENV["PLAYLISTER_ENV"]].connect!
DB = ActiveRecord::Base.connection

if ENV["PLAYLISTER_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end

hotline_bling = Song.create(:name=>'Hotline Bling')
thriller = Song.create(:name=>'Thriller')

drake = Artist.create(:name=>'Drake')
mj = Artist.create(:name=>'Michael Jackson')

rap = Genre.create(:name=>'Rap')
pop = Genre.create(:name=>'Pop')

hotline_bling.artist = drake
thriller.artist = mj

drake.songs << hotline_bling
mj.songs << thriller

pop.songs << thriller
rap.songs << hotline_bling

# binding.pry
