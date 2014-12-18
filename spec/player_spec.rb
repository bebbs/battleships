require 'player'

describe Player do

  let(:player){Player.new(board_double)}
  let(:board_double){double :board_double, new: board}
  let(:board){double :board}

  context 'a player can' do

    it 'have a board' do
      allow(player).to receive(:board_setup).with(Board)
      expect(player.board).to eq(board)
    end

  end
end