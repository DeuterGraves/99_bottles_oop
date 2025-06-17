class Bottles

    def verse(count)
        "#{first_word(count)} #{bottle_plural_agreement(count)} of beer on the wall, #{bottle_number(count)} #{bottle_plural_agreement(count)} of beer.\n#{second_phrase(count)}"
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

    def first_word(count)
        if bottle_number(count).is_a? String
            bottle_number(count).capitalize
        else
            bottle_number(count)
        end
    end

    def second_phrase(count)
        if count == 0
            "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
        else
            "Take #{bottle_pronoun(count)} down and pass it around, #{bottle_number(count-=1)} #{bottle_plural_agreement(count)} of beer on the wall.\n"
        end
    end

    def verses(max, min)
        lyrics = ""

        max.downto(min) do |count| 
          lyrics << "#{verse(count)}\n"
        end

        # count_array = (min..max).to_a
        # count_array.each do |count|
        #     lyrics << verse(count)
        # end

        lyrics
        # step through the numbers call the verse on each step
    end
end
