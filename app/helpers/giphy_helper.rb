module GiphyHelper

  Giphy::Configuration.configure do |config|
    config.version = "v1"
    config.api_key = "dc6zaTOxFJmzC"
  end


  def search

  giphy_search = Giphy.search('', {limit: 1, offset: 1})
  @gif = giphy_search

  end


end
