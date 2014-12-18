require 'player'

describe Player do

  let(:player){Player.new(player1, board_double, fleet_double)}
  let(:player1){double :player1}
  let(:board_double){double :board_double, new: board}
  let(:fleet_double){double :fleet_double, new: fleet}
  let(:board){double :board}
  let(:fleet){double :fleet}
  let(:cell_double){double :cell_double}

  context 'a player can' do

    it 'have a board' do
      expect(player.board).to eq(board)
    end

    it 'have a fleet' do
      expect(player.fleet).to eq(fleet)
    end

    it 'have a name' do
      expect(player.name).to eq(player1)
    end

    it 'receive a shot' do
      allow(board).to receive(:cell_object).with(:A1).and_return(cell_double)
      expect(board.cell_object(:A1)).to receive(:hit!)
      player.receive_shot(:A1)
    end

  end
end