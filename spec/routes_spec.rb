require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end

  it "accesing the post by id route" do
    get '/post/1'
    last_response.should be_ok
  end


  it "accesing the author by name route" do
    get '/author/Pixelated'
    last_response.should be_ok
  end


  it "accesing the posts by tag name route" do
    get '/tags/fitness'
    last_response.should be_ok
  end

end