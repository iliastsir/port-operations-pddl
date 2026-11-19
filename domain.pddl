(define (domain port-operations)
    (:requirements :strips :typing)
    (:types dock container robot)
    
    (:predicates
        (connected ?d1 - dock ?d2 - dock)
        (at-robot ?r - robot ?d - dock)
        (at-container ?c - container ?d - dock)
        (free-dock ?d - dock)
        (on ?c1 - container ?c2 - container)
        (on-base ?c - container ?d - dock)
        (clear ?c - container)
        (in ?c - container ?r - robot)
        (empty ?r - robot)
    )
    
    (:action move
      :parameters (?r - robot ?from - dock ?to - dock)
      :precondition (and
            (at-robot ?r ?from)
            (connected ?from ?to)
            (free-dock ?to)
      )
      :effect (and
            (not (at-robot ?r ?from))
            (at-robot ?r ?to)
            (not (free-dock ?to))
            (free-dock ?from)
      )
    )
    
    (:action load-from-base
        :parameters (?r - robot ?c - container ?d - dock)
        :precondition (and
            (at-robot ?r ?d)
            (empty ?r)
            (at-container ?c ?d)
            (on-base ?c ?d)
            (clear ?c)
        )
        :effect (and 
            (not (empty ?r))
            (in ?c ?r)
            (not (at-container ?c ?d))
            (not (on-base ?c ?d))
            (not (clear ?c))
        )
        
    )
    
    (:action load-from-top
        :parameters (?r - robot ?c - container ?c_under - container ?d - dock)
        :precondition (and
            (at-robot ?r ?d)
            (empty ?r)
            (at-container ?c ?d)
            (at-container ?c_under ?d)
            (on ?c ?c_under)
            (clear ?c)
        )
        :effect (and 
            (not (empty ?r))
            (in ?c ?r)
            (not (at-container ?c ?d))
            (not (on ?c ?c_under))
            (not (clear ?c))
            (clear ?c_under)
        )
    )
    
    
    (:action unload-to-base
        :parameters (?r - robot ?c - container ?d - dock)
        :precondition (and
            (at-robot ?r ?d)
            (in ?c ?r)
      )
        :effect (and
            (empty ?r)
            (not (in ?c ?r))
            (at-container ?c ?d)
            (on-base ?c ?d)
            (clear ?c)
      )
    )
    
    (:action unload-to-top
        :parameters (?r - robot ?c - container  ?c_under - container ?d - dock)
        :precondition (and
            (at-robot ?r ?d)
            (in ?c ?r)
            (at-container ?c_under ?d)
            (clear ?c_under)
      )
        :effect (and
            (empty ?r)
            (not (in ?c ?r))
            (at-container ?c ?d)
            (on ?c ?c_under)
            (clear ?c)
            (not (clear ?c_under))
      )
    )
)