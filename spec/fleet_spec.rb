require 'fleet'

describe Fleet do

  let(:fleet) {Fleet.new}

  context 'a fleet when initialised should' do

    it 'have 9 ships' do
      expect(fleet.ship_array.length).to eq 9
    end

  end

  context 'a fleet should know when it\'s' do

    it 'should evaluate the status of all the ships' do
      fleet.ship_status
      expect(fleet.ship_status_array.length).to eq(9)
    end

    it 'should know the status of each ship' do
      fleet.ship_status
      expect(fleet.ship_status_array.all? {|status| status == true || status == false }).to be true
    end

    it 'ships are all floating' do
      allow(fleet).to receive(:ship_status_array).and_return([false, false, false, false, false, false, false, false, false])
      expect(fleet).not_to be_sunk
    end

    it 'ships are all sunk' do
      allow(fleet).to receive(:ship_status_array).and_return([true, true, true, true, true, true, true, true, true])
      expect(fleet).to be_sunk
    end

    it 'some, but not all ships are sunk' do
      allow(fleet).to receive(:ship_status_array).and_return([true, false, true, false, true, false, true, false, true])
      expect(fleet).not_to be_sunk
    end


  end
 
end