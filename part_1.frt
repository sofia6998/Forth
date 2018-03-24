
( 4 )
: is_prime
    dup 1 = if 0 . else
      dup 2 = if 1 . else
        dup dup 2 do dup r@ % if else r> drop dup >r drop 6 then loop = .
      then
    then ;

( 5 )
: write 1 allot dup rot swap ! . ;

( 3 )
: is_even 2 % 0 = . ;

: inc 1 + ;
: dec 1 - ;

( 7 )
: move_str ( Aold Anew )  ( РАБОТАЕТ! )
  swap dup >r swap
    dup rot dup count ( Anew Anew Aold len )
    0 do  ( Anew Anew Aold )
     dup c@ ( Anew Anew+i Aold+i c[i] )
     rot c! ( Anew Aold+i ) ( записали символ )
     swap dup r@ + rot ( Anew Anew+i Aold+i )
      inc swap inc swap ( Anew Anew+i+1 Aold+i+1 )
    loop
    drop drop
    r> heap-free
;

: concat
    dup count    ( adr1 adr2 len2 )
    rot dup count    ( adr2 len2 adr1 len1 )
    rot               ( adr2 adr1 len1 len2 )
    +  ( adr2 adr1 len12 ) 1 +
    heap-alloc ( adr2 adr1 adr12 )
    swap dup count ( adr2 adr12 adr1 len1 )
    swap rot ( adr2 len1 adr1 adr12 )
    move_str ( adr2 len1 adr12 )
    dup rot + ( adr2 adr12 adr12_2 )
    rot swap ( adr12 adr2 adr12_2 )
    move_str ( adr12 adr12_2 )
    drop
    ( adr12 )
;

( second part )
: collatz  ( a1 )
    repeat
      dup 2 %
      if dup 3 * inc else dup 2 / then
      dup 1 =
    until
;
