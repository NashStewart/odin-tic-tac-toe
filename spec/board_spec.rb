# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  let(:player_o_mark) { 'O' }
  let(:player_x_mark) { 'X' }

  describe '#update_cell' do
    context 'when cell is empty' do
      subject(:empty_board) { described_class.new }
      let(:row_min) { 0 }
      let(:row_max) { 2 }
      let(:column_min) { 0 }
      let(:column_max) { 2 }

      it 'updates cell to player mark' do
        row = 1
        column = 2

        empty_board.update_cell(row, column, player_x_mark)
        updated_cell = empty_board.cells[row][column]

        expect(updated_cell).to eq(player_x_mark)
      end

      it 'does not raise error if row is positively invalid' do
        invalid_row = row_max + 1
        valid_column = 2
        
        expect { empty_board.update_cell(invalid_row, valid_column, player_x_mark) }.not_to raise_error
      end
      
      it 'does not raise error if row is negatively invalid' do
        invalid_row = row_min - 1
        valid_column = 2
        
        expect { empty_board.update_cell(invalid_row, valid_column, player_x_mark) }.not_to raise_error
      end
      
      it 'does not raise error if column is positively invalid' do
        valid_row = 1
        invalid_column = column_max + 1
        
        expect { empty_board.update_cell(valid_row, invalid_column, player_x_mark) }.not_to raise_error
      end
      
      it 'does not raise error if column is negatively invalid' do
        valid_row = 1
        invalid_column = column_min - 1
        
        expect { empty_board.update_cell(valid_row, invalid_column, player_x_mark) }.not_to raise_error
      end
    end

    context 'when cell is populated' do
      subject(:populated_o_board) { described_class.new(Array.new(3, Array.new(3, player_o_mark))) }
      
      it 'does not update cell' do
        row = 1
        column = 2

        populated_o_board.update_cell(row, column, player_x_mark)
        updated_cell = populated_o_board.cells[row][column]

        expect(updated_cell).to eq(player_o_mark)
      end
    end
  end

  describe '#horizontal_match?' do
    context 'when player O has a match' do
      let(:row_one) { Array.new(3, player_o_mark) }
      let(:row_two) { Array.new(3, nil) }
      let(:row_three) { [player_o_mark, nil, player_x_mark] }
      subject(:horizontal_o_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player O mark is given' do
        result = horizontal_o_match_board.horizontal_match?(player_o_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player X mark is given' do
        result = horizontal_o_match_board.horizontal_match?(player_x_mark)
        expect(result).to eq(false)
      end
    end

    context 'when player X has a match' do
      let(:row_one) { Array.new(3, nil) }
      let(:row_two) { Array.new([nil, player_o_mark, player_x_mark]) }
      let(:row_three) { Array.new(3, player_x_mark) }
      subject(:horizontal_x_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player X mark is given' do
        result = horizontal_x_match_board.horizontal_match?(player_x_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player O mark is given' do
        result = horizontal_x_match_board.horizontal_match?(player_o_mark)
        expect(result).to eq(false)
      end
    end
  end

  describe '#vertical_match?' do
    context 'when player O has a match' do
      let(:row_one) { [player_o_mark, nil, player_x_mark] }
      let(:row_two) { [player_o_mark, player_x_mark, nil] }
      let(:row_three) { [player_o_mark, nil, player_x_mark] }
      subject(:vertical_o_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player O mark is given' do
        result = vertical_o_match_board.vertical_match?(player_o_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player X mark is given' do
        result = vertical_o_match_board.vertical_match?(player_x_mark)
        expect(result).to eq(false)
      end
    end

    context 'when player X has a match' do
      let(:row_one) { [nil, player_o_mark, player_x_mark] }
      let(:row_two) { [nil, player_o_mark, player_x_mark] }
      let(:row_three) { [player_o_mark, nil, player_x_mark] }
      subject(:vertical_x_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player X mark is given' do
        result = vertical_x_match_board.vertical_match?(player_x_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player O mark is given' do
        result = vertical_x_match_board.vertical_match?(player_o_mark)
        expect(result).to eq(false)
      end
    end
  end

  describe '#slope_down_match?' do
    context 'when player O has a match' do
      let(:row_one) { [player_o_mark, nil, player_x_mark] }
      let(:row_two) { [nil, player_o_mark, player_x_mark] }
      let(:row_three) { [nil, player_x_mark, player_o_mark] }
      subject(:downward_o_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player O mark is given' do
        result = downward_o_match_board.slope_down_match?(player_o_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player X mark is given' do
        result = downward_o_match_board.slope_down_match?(player_x_mark)
        expect(result).to eq(false)
      end
    end

    context 'when player X has a match' do
      let(:row_one) { [player_x_mark, player_o_mark, nil] }
      let(:row_two) { [nil, player_x_mark, player_o_mark] }
      let(:row_three) { [player_o_mark, nil, player_x_mark] }
      subject(:downward_x_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player X mark is given' do
        result = downward_x_match_board.slope_down_match?(player_x_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player O mark is given' do
        result = downward_x_match_board.slope_down_match?(player_o_mark)
        expect(result).to eq(false)
      end
    end
  end

  describe '#slope_up_match?' do
    context 'when player O has a match' do
      let(:row_one) { [player_x_mark, nil, player_o_mark] }
      let(:row_two) { [nil, player_o_mark, player_x_mark] }
      let(:row_three) { [player_o_mark, player_x_mark, nil] }
      subject(:upward_o_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player O mark is given' do
        result = upward_o_match_board.slope_up_match?(player_o_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player X mark is given' do
        result = upward_o_match_board.slope_up_match?(player_x_mark)
        expect(result).to eq(false)
      end
    end

    context 'when player X has a match' do
      let(:row_one) { [nil, player_o_mark, player_x_mark] }
      let(:row_two) { [player_o_mark, player_x_mark, player_o_mark] }
      let(:row_three) { [player_x_mark, nil, player_o_mark] }
      subject(:upward_x_match_board) { described_class.new([row_one, row_two, row_three]) }

      it 'returns true when Player X mark is given' do
        result = upward_x_match_board.slope_up_match?(player_x_mark)
        expect(result).to eq(true)
      end

      it 'returns false when Player O mark is given' do
        result = upward_x_match_board.slope_up_match?(player_o_mark)
        expect(result).to eq(false)
      end
    end
  end

  describe '#three_in_a_row?' do
    context 'when Player X has horizontal match' do
      let(:row_one) { [player_o_mark, nil, nil] }
      let(:row_two) { [player_x_mark, player_x_mark, player_x_mark] }
      let(:row_three) { [nil, player_o_mark, player_o_mark] }
      subject(:horizontal_match_board) { described_class.new([row_one, row_two, row_three]) }
      
      it 'returns true when Player X mark is given' do
        result = horizontal_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end

      it 'returns false when Player O mark is given' do
        result = horizontal_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end
    end

    context 'when Player X has vertical match' do
      let(:row_one) { [player_o_mark, player_x_mark, nil] }
      let(:row_two) { [nil, player_x_mark, player_o_mark] }
      let(:row_three) { [player_o_mark, player_x_mark, nil] }
      subject(:vertial_match_board) { described_class.new([row_one, row_two, row_three]) }
      
      it 'returns true when Player X mark is given' do
        result = vertial_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end

      it 'returns false when Player O mark is given' do
        result = vertial_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end
    end

    context 'when Player X has downward diagonal match' do
      let(:row_one) { [player_x_mark, player_o_mark, nil] }
      let(:row_two) { [nil, player_x_mark, player_o_mark] }
      let(:row_three) { [player_o_mark, nil, player_x_mark] }
      subject(:downward_match_board) { described_class.new([row_one, row_two, row_three]) }
      
      it 'returns true when Player X mark is given' do
        result = downward_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end

      it 'returns false when Player O mark is given' do
        result = downward_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end
    end

    context 'when Player X has upward diagonal match' do
      let(:row_one) { [player_o_mark, player_o_mark, player_x_mark] }
      let(:row_two) { [player_o_mark, player_x_mark, nil] }
      let(:row_three) { [player_x_mark, nil, nil] }
      subject(:upward_match_board) { described_class.new([row_one, row_two, row_three]) }
      
      it 'returns true when Player X mark is given' do
        result = upward_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end

      it 'returns false when Player O mark is given' do
        result = upward_match_board.three_in_a_row?(player_x_mark)
        expect(result).to eq(true) 
      end
    end
  end
end
