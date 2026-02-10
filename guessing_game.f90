program hello
    implicit none
    real :: r 
    integer :: random_int
    integer :: guess_int
    integer :: attempts = 0;
    CHARACTER(len=3) :: guess
    CHARACTER(len=3) :: attempts_str

    call random_seed()
    call random_number(r)
    random_int = int(r * 100) + 1

    DO WHILE (guess_int /= random_int)
        attempts = attempts + 1
        WRITE(*,*) "Guess a number between 1-100: "
        READ(*,*) guess
        read (guess, '(I10)') guess_int

        IF (guess_int > random_int) THEN
            WRITE(*,*) "Too high"
        END IF

        IF (guess_int < random_int) THEN
            WRITE(*,*) "Too low"
        END IF
    END DO

    write(attempts_str, '(I0)') attempts

    WRITE(*,*) "You got it in " // attempts_str // "attempts"
end program hello
