require 'player'

describe Player do

  let(:player){Player.new(player1, board_double, fleet_double)}
  let(:player1){double :player1}
  let(:board_double){double :board_double, new: board}
  let(:fleet_double){double :fleet_double, new: fleet}
  let(:board){double :board}
  let(:fleet){double :fleet}


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

  end
end