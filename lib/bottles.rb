class Bottles

    def verse(count)
        "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-=1} #{bottle_plural_agreement(count)} of beer on the wall.\n"
    end

    def bottle_plural_agreement(count)
        if count == 1
            "bottle"
        else
            "bottles"
        end
    end

end
