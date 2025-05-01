program syntax_if

        implicit none
        integer:: i = 5

        if (i>3) then
                print *, "Bigger than 3"
        else
                print *, "Smaller than 3"
        endif

endprogram
