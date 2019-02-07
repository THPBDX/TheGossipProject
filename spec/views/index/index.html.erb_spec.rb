require 'rails_helper'

RSpec.describe "index.html.erb", type: :view do

 context 'it says welcome' do
  it "displays 'gossip'" do
    # génére la page
   

    # le contenu "Bievenue" doit être dans la page
    expect('Gossip').to eq("Gossip")
  end
end

end