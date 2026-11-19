(define (problem port-problem-1)
    (:domain port-operations)
    (:objects
        d1 d2 d3 - dock
        c1 c2 c3 - container
        r1 - robot
    )
    
    (:init
        ;;Dromoi Diplhs Kykloforias
        (connected d1 d3) (connected d3 d1)
        (connected d2 d1) (connected d1 d2)
    
    ;;Katastash rombot
    (at-robot r1 d2)
    (empty r1)
    (free-dock d1)
    (free-dock d3)
    ;;To d2 den eina free giati exei to r1
    
    ;; katastash sto d1
    (at-container c1 d1)
    (on-base c1 d1)
    (at-container c3 d1)
    (on c3 c1)
    (clear c3)
    
    ;;katastash sto d2
    (at-container c2 d2)
    (on-base c2 d2)
    (clear c2)
    )
    
    (:goal
        (and
        ;;To r1 einai sto d1
            (at-robot r1 d1)
            
            ;;sto d3 einai to c3
            (at-container c3 d3)
            (on-base c3 d3)
            (clear c3)
            
            ;;sto d3 yparxei h stoiva c1 panw sto c2
            (at-container c2 d3)
            (on-base c2 d3)
            (at-container c1 d3)
            (on c1 c2)
            (clear c1)
        )    
    )
)