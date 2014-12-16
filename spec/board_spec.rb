require 'board'

describe Board do
  
  context do 'a grid when initialised should'

    let(:board) {Board.new}
  
    it 'have 100 cells' do
      expect(board.grid.length).to eq(100)
    end

  end

end