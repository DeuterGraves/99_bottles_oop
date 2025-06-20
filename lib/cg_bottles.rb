class CgBottles
  def verse(count)
    case count
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottles of beer on the wall.\n"
    end
  end
end