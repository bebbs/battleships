require 'fleet'

describe Fleet do
  
  let(:fleet) {Fleet.new}

  context 'fleet creation should' do 

    it 'have 9 ships in total' do
      expect(fleet.dock.length).to eq(9)
    end

    
  end

end