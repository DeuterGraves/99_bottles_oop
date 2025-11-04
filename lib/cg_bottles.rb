class CgBottles
  def verse(count)
    case count
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottle of beer on the wall.\n"
    # when 6
    #   "1 six-pack of beer on the wall, 1 six-pack of beer.\nTake one down and pass it around, 5 bottles of beer on the wall.\n"
    # when 7
    #   "7 bottles of beer on the wall, 7 bottles of beer.\nTake one down and pass it around, 1 six-pack of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottles of beer on the wall.\n"
    end
  end

  def verses(max, min)
    max.downto(min).collect{|count| verse(count)}.join("\n")
  end

  def song
    verses(99,0)
  end
end