#set page(
  margin: 1cm
)

#set text(
  size: 18pt
)

#set heading(
  numbering: "1."
)

#let important_block(body,color,text_color) = {
  set text(text_color)
  rect(
    fill:color,
    radius:10%,
    width:100%,
    inset: 8pt + 4pt,
    [#body]
  )
}

#let definition_block(body) = {
  important_block([#body],blue,white)
} 

#let theorem_block(body) = {
  important_block([#body],red,white)
}

#let proof_block(body) = {
  important_block([#body],green,black)
}

#let incomplete_proof_block(body) = {
  important_block([#body],gray,black)
}

= Color code explained 
#definition_block()[
  Definition Block
]
#theorem_block()[
  Theorem Block
]
#proof_block()[
  Proof Block
]
#incomplete_proof_block()[
  Proof that cannot be completed without more info so it is incomplete
]

= Automata and Language

#definition_block()[
  == Finite State Automate

  a FA is a tuple $M = (Q,Sigma,delta,q_0,F)$ where

  1. $Q$ is a finite set called states
  2. $Sigma$ is a finite set called the alphabet
  3. $delta: Q times Sigma arrow.long Q$ is the transition function
  4. $q_0 in Q$ is the initial state
  5. $F subset.eq Q$ is the set of accept states
]

#definition_block()[
  == Computation

  Let $M = (Q,Sigma,delta,q_0,F)$ and let $w = w_0,w_1 ... w_n$ a string of $[Sigma]$ $M$ accepts $w$ if $exists r_0,r_1,...,r_n in Q$ where:

  1. $r_0 = q_0$
  2. $r_(i + 1) = delta(r_i, w_(i+1))$ for $i = 0 ... n-1$ 
  3. $r_n in F$ 
]

#definition_block()[
  == regular language

  A language is regular if some finite automata recognizes it
]

#definition_block()[
  === regular operations
  Let $A$ and $B$ be regular languages, there a three operations *union*, *concatenation* and *star* as follows :
  - *Union:* $A union B = {x | x in A or x in B}$ 
  - *Concatenation:* $A circle.tiny B = {x y | x in A and y in B}$
  - *Star:* $A^star = {x_1,x_2,...,x_n | n gt.eq 0 and x_i in A}$ 
]


#theorem_block()[
  ==== Theorem closedness under union
  $A$ and $B$ are regular languages then $A union B$ 
]

#proof_block()[
  ===== Proof
  Let $M_1$ a state machine recognizes $A_1$ \
  Let $M_2$ a state machine recognizes $A_2$ \

  we can construct $M$ a state machine recognizes $A_1 union A_2$ defined as follows 

  1. $M.Q = M_1.Q times M_2.Q$
  2. $M.Sigma = M_1.Sigma union M_2.Sigma$
  3. $M.delta((r_1,r_2),a) = (M_1.delta(r_1,a),M_2.delta(r_2,a)) $
  4. $M.q_0 = (M_1.q_0, M_2.q_0) $
  5. $M.F = {(f_1,f_2) | f_1 in M_1.F or f_2 in M_2.F}$
]


#theorem_block()[
  ==== Theorem colosedness under concatenation
  $A$ and $B$ are regular languages then $A circle.tiny B$ is a regular languages
]

#incomplete_proof_block()[
  ===== incomplete Proof
  Let $M_1$ a state machine recognizes $A_1$ \
  Let $M_2$ a state machine recognizes $A_2$ \

  we can construct $M$ a state machine recognizes $A_1 circle.tiny A_2$ defined as follows 
  
  Cannot be done without non determinism 
]


#definition_block()[
  == Non deterministic finite state Automata NFA
  a NFA is a tuple $M = (Q,Sigma,delta,q_0,F)$ where

  1. $Q$ is a finite set called states
  2. $Sigma$ is a finite set called the alphabet here sigma includes $epsilon$ the empty input 
  3. $delta: Q times Sigma arrow.long P(Q)$ is the transition function
  4. $q_0 in Q$ is the initial state
  5. $F subset.eq Q$ is the set of accept states
]


#theorem_block()[
  === Theorem equivalence of NFA and DFA

  DFA and NFA are equivalent meaning forall languages recognized by DFA there is an NFA that recognizes and the reciproc is valid 
]


#proof_block()[
  ==== Proof: DFA $arrow.double$ NFA
  
  forall DFA there is an NFA: \
  Let $M_1$ a DFA recognizes $A$ \
  we can construct an NFA $M$ that recognizes $A$

  1. $M.Q = M_1.Q$
  2. $M.Sigma = M_1.Sigma$
  3. $M.delta(q,a) = {M_1.delta(q,a)}$
  4. $M.q_0 = M_1.q_0$
  5. $M.F = M_1.F$
]

#proof_block()[
  ==== Proof: NFA $arrow.double$ DFA
  forall NFA there is a DFA: \
  Let $M_1$ a NFA recognizes $A$ \
  we can construct an NFA $M$ that recognizes $A$

  1. $M.Q = P(M_1.Q)$
  2. $M.Sigma = M_1.Sigma$
  3. $M.delta(R,a) = union.big_(r in R) M_1.delta(r,a) union  union.big_(r in R) M_1.delta(M_1.delta(r,a),epsilon) $ the second union here is to account for state that have and $epsilon$/empty transition
  4. $M.q_0 = {M_1.q_0}$
  5. $M.F = {f | f in M.Q "where " exists x in f "such that " x in M_1.F }$ in human it means the final state of $M$ must containt at least one final state of $M_1$
]

#proof_block()[
  ==== Proof: NFA $arrow.l.r.double.long$ DFA

  using *NFA $arrow.double$ DFA* and *DFA $arrow.double$ NFA* we get *NFA $arrow.l.r.double.long$ DFA*
]


#theorem_block()[
  ==== Theorem Closure under union using NFA
  $A$ and $B$ are regular languages then $A union B$ is a regular language
]

#proof_block()[
  ===== Proof
  Let $N_1$ recognize $A_1$ , and $N_2$ recognize $A_2$ we can construct $N$ such that it can recognize  $A_1 union A_2$ as follows:
  1. $N.Q = {q_0} union N_1.Q union N_2.Q$ 
  2. $N.Sigma = N_1.Sigma union N_2.Sigma$ 
  3. $N.delta$ is defined as follows
    - $N.delta(q_0,epsilon) = {N_1.q_0, N_2.q_0}$
    - $N.delta(N_1.q,a) = N_1.delta(N_1.q,a)$
    - $N.delta(N_2.q,a) = N_2.delta(N_2.q,a)$
    - $N.delta(\_,\_) = emptyset$
  4. $q_0$ is the starting state of 
  5. $N.F = N_1.F union N_2.F$
]

#theorem_block()[
  ==== Theorem Closure under concatenation using NFA
  $A$ and $B$ are regular languages then $A circle.tiny B$ is a regular language
]

#proof_block()[
  Let $N_1$ recognize $A_1$ , and $N_2$ recognize $A_2$ we can construct $N$ such that it can recognize  $A_1 circle.tiny A_2$ as follows:

  1. $N.Q = N_1.Q union N_2.Q$
  2. $N.Sigma = N_1.Sigma union N_2.Sigma$
  3. $N.delta$ is defined as follows
    - $N.delta(q,epsilon) = N_1.delta(q,epsilon) union {N_2.q_0} "if" q in N_1.F$
    - $N.delta(N_1.q,a) = N_1.delta(N_1.q,a)$
    - $N.delta(N_2.q,a) = N_2.delta(N_2.q,a)$
  4. $N.q_0 = N_1.q_0$
  5. $N.F = N_2.F$
]


#theorem_block()[
  ==== Theorem Closure under star using NFA
  $A$ is a regular language then $A^star$ is a regular language
]

#proof_block()[
  Let $N_1$ recognize $A$, we can construct $N$ such that it can recognize $A^star$ as follows:
  1. $N.Q = {N.q_0} union N_1.Q$
  2. $N.Sigma = N_1.Sigma$
  3. $N.delta$ is defined as follows
    - $N.delta(N.q_0, epsilon) = {N_1.q_0}$
    - $N.delta(N.q_0,\_) = emptyset$
    - $N.delta(N.q_f,epsilon) = {N_1.q_0} union N_1.delta(N.q_f,epsilon) "where " N.q_f in N.F$ 
    - $N.delta(q,a) = N_1.delta(q,a)$
  4. $N.q_0$ is a new state
  5. $N.F = N.q_0 union N_1.F$ 
]


#definition_block()[
  == Regular Expression
  we Say R is a regular expression of an alphabet $Sigma$ if R is:
  1. $a in Sigma$
  2. $epsilon$
  3. $emptyset$
  4. $R_1 union R_2$ 
  5. $R_1 circle.tiny R_2$
  6. $R_1^star$
  where $R_1,R_2$ are regular expressions 
]
