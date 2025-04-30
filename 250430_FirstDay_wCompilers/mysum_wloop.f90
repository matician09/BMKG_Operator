program mysum

        implicit none
        integer::sum=0, i
        integer::tar=1000

        do i = 1,tar
            sum = sum + i
        enddo

        print *, sum

endprogram
