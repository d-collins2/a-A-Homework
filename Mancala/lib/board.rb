class InvalidCupError < StandardError; end
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times do
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup"  if start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
     dis_stones = @cups[start_pos]
    @cups[start_pos] = []
     placement = start_pos
    until dis_stones.empty?
      placement += 1
      placement = 0 if placement > 13
      if placement == 6
        @cups[placement] << dis_stones.shift if current_player_name == @name1
      elsif placement == 13
        @cups[placement] << dis_stones.shift if current_player_name == @name2
      else
        @cups[placement] << dis_stones.shift
      end
    end
    render
    next_turn(placement)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def [](pos)
    x, y = pos
    cups[x][y]
  end

  def []=(pos, value)
    x, y = pos
    cups[x][y] = value
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
     @cups[0..5].all?{ |cup| cup.empty? } ||
     @cups[7..12].all?{ |cup| cup.empty? }
  end

  def winner
    player1 = @cups[6].count
    player2 = @cups[13].count

    if player1 == player2
      :draw
    elsif player1 > player2
      @name1
    else
      @name2
    end
  end
end
