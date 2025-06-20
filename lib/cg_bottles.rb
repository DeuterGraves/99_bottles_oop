class CgBottles
  def verse(count)
    if count == 99
      n = 99
    else
      n = 3
    end

    "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end
end