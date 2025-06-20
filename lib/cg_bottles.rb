class CgBottles
  def verse(count)
    "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottle#{'s' unless (count-1) == 1} of beer on the wall.\n"
  end
end