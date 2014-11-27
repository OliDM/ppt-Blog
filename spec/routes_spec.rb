require File.expand_path '../spec_helper.rb', __FILE__
require 'debugger'
describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    debugger
    expect(last_response.ok?).to eq(true)
  end

  it "accesing the post by id route" do
    get '/post/1'
    expect(last_response.ok?).to eq(true)
  end


  it "accesing the author by name route" do
    get '/author/Pixelated'
    expect(last_response.ok?).to eq(true)
  end


  it "accesing the posts by tag name route" do
    get '/tags/fitness'
    expect(last_response.ok?).to eq(true)
  end

end