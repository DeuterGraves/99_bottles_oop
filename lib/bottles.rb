class Bottles

    def verse(count)
        "#{bottle_number(count)} #{bottle_plural_agreement(count)} of beer on the wall, #{bottle_number(count)} #{bottle_plural_agreement(count)} of beer.\nTake #{bottle_pronoun(count)} down and pass it around, #{bottle_number(count-=1)} #{bottle_plural_agreement(count)} of beer on the wall.\n"
    end

    def bottle_plural_agreement(count)
        if count == 1
            "bottle"
        else
            "bottles"
        end
    end

    def bottle_number(count)
        if count > 0
            count
        else count <= 0
            "no more"
        end
    end

    def bottle_pronoun(count)
        if count > 1
            "one"
        else
            "it"
        end
    end
end
