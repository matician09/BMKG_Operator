program mysum

        implicit none
        real::sum
        real::tar=1000

        sum = tar * (1+tar) / 2

        print *, sum

endprogram
