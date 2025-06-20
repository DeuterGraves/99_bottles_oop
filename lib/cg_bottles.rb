class CgBottles
  def verse(count)
    case count
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottles of beer on the wall.\n"
    end
  end

  def verses(_,_)
    "99 bottles of beer on the wall, 99 bottles of beer.\n" +
    "Take one down and pass it around, 98 bottles of beer on the wall.\n"+
    "\n" +
    "98 bottles of beer on the wall, 98 bottles of beer.\n" +
    "Take one down and pass it around, 97 bottles of beer on the wall.\n"
  end
end