class Node
  def initialize(pos, last_node = nil)
    @last_node = last_node
    @pos = pos
  end

  def pos
    @pos
  end

  def last_node
    @last_node
  end
end