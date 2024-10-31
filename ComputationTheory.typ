#import "lib.typ": *



#set page(
  margin: 1cm
)

#set text(
  size: 18pt
)

#set heading(
  numbering: "1."
)
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak:true) 
  strong(it)
}

#outline()

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
  ==== Theorem closure under concatenation
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
  === Theorem Closure under union using NFA
  $A$ and $B$ are regular languages then $A union B$ is a regular language
]

#proof_block()[
  ==== Proof
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
  === Theorem Closure under concatenation using NFA
  $A$ and $B$ are regular languages then $A circle.tiny B$ is a regular language
]

#proof_block()[
  ==== Proof
  
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
  === Theorem Closure under star using NFA
  $A$ is a regular language then $A^star$ is a regular language
]

#proof_block()[
  ==== Proof
  
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


#theorem_block()[
  === Theorem: regular language $arrow.double$ regular expression

  a language is regular iff some regular expression describes it
]

#theorem_block()[
  ==== Lemma: regular expression $arrow.double$ regular language
]

#proof_block()[
  ===== Proof
  in order to prove this lets consider the 6 cases for describing $R$ and make a NFA for each 

  1. $R = a "for" a in Sigma$ so $L(R) = {a}$ for this we have the following NFA $N = ({q_0,q_1},Sigma,delta,q_0,{q_1})$ where $delta(q_0,a) = {q_1}$ else $emptyset$
    
  2. $R = epsilon$ so $L(R) = {epsilon}$ for this we have the following NFA $N = ({q_0},Sigma,delta,q_0,{q_0})$ where $delta(\_,\_) = emptyset$
    
  3. $R = emptyset$ so $L(R) = emptyset$ for this we have the following NFA $N = ({q_0},Sigma,delta,q_0,emptyset)$ where $delta(\_,\_) = emptyset$
  
  4. $R = R_1 union R_2$ so $L(R) = L(R_1) union L(R_2)$ we have $N_1, N_2$ for $L(R_1), L(R_2)$ so we can build $N$ for their union
  
  5. $R = R_1 circle.tiny R_2$ so $L(R) = L(R_1) union L(R_2)$ we have $N_1, N_2$ for $L(R_1), L(R_2)$ so we can build $N$ for their concatenation
  
  6. $R = R_1^star$ so $L(R) = L(R_1)^star$ we have $N_1$ for $L(R_1)^star$ so we can build $N$ for its star operation
  
]

#theorem_block()[
  ==== Lemma: regular language $arrow.double$ regular expression
]

before making the proof we need to define a new automat a generalized nondeterministic finite automaton GNFA which to make an equivalence between regular languages and GNFA then using showing the equivalence between GNFA and regular expression

#definition_block()[
  ===== GNFA 
  A generalized nondeterministic finite automaton is a 5-tuple $(Q,Sigma,delta,q_"start",q_"accept")$, where:
  1. $Q$ is a finite set of state
  2. $Sigma$ is the input alphabet
  3. $delta: (Q - {q_"accept"}) times (Q - {q_"start"}) arrow.long R$ is the transition function
    - $R$ is the set for regular expressions over the set of alphabet $Sigma$
  4. $q_"start" $ is the starting state
  5. $q_"accept"$ is the accepting state
]

#definition_block()[
  ===== my definition of GNFA 
  A generalized nondeterministic finite automaton is a 7-tuple $(Q,Sigma,R,theta,delta,q_"start",q_"accept")$, where:
  + $Q$ is a finite set of state
  + $Sigma$ is the input alphabet
  + $R$ is a set of regular expressions over $Sigma$
  + $theta: (Q - {q_"accept"}) times (Q - {q_"start"}) arrow.long R$ is the assignment function
  + $delta: Q times R arrow.long Q$ is the transition function where: $delta(q_i,r_i) = {q_j|r_i = theta(q_i,q_j)}$
  + $q_"start" $ is the starting state
  + $q_"accept"$ is the accepting state
]



#proof_block()[
  ===== Proof: DFA $arrow.double$ GNFA

  we have a DFA $M$ that recognizes language $L$ we can construct a GNFA $G$ that recognizes the language $L$ as follows: $G = ({q_"start",q_"accept"},M.Sigma,R,theta,delta,q_"start",q_"accept")$ where 

  + $R = {w | w in L}$
  + $theta(q_"start",q_"accept") = R$
  + $delta(q_"start",r) = q_"accept"$
]

#proof_block()[
  ===== Proof of theorem
  DFA can be converted into GNFA which can be converted into regular expressions
]

#proof_block()[
  === Proof: from the previous 2 lemmas
]

#theorem_block()[
  == The Pumping Lemma

  
]
