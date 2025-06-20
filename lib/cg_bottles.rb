class CgBottles
  def verse(count)
    "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} #{pluralize(count)} of beer on the wall.\n"
  end

  def pluralize(count)
    "bottle#{'s' unless (count-1) == 1}"
  end
end