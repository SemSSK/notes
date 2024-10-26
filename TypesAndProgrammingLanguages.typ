#import "@preview/curryst:0.3.0": rule, proof-tree

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

#let myproof(premise,conclusion) = {
  proof-tree(
    rule(
      [#premise],
      [#conclusion]
    ),
  )
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

= Untyped Systems
== Untyped Arithmetic Expressions

#definition_block()[
  === Language used
  ```
    t ::=
          true
          false
          if t then t else t
          0
          succ t
          pred t
          iszero t
  ```
]

#definition_block()[
  === Inductive definition of the language
  the smallest set $T$ is defined as
  1. ${"true","false",0} subset.eq T$
  2. $t_1 in T, "then" {"succ" t_1,"pred" t_1, "iszero" t_1} subset.eq T$
  3. $"if" t_1,t_2,t_3 in T "then if " t_1 " then " t_2 " else " t_3 in T$
]

#definition_block()[
  === Inference rules definition of the language
  #align(center)[

      #table(columns:3,stroke: none )[ 
        true $in T$
      ][
        false $in T$
      ][
        0 $in T$
      ][
        #myproof(
          [$t_1 in T$],
          [succ $t_1 in T$]
        )
      ][
        #myproof(
          [$t_1 in T$],
          [pred $t_1 in T$]
        )
      ][
        #myproof(
          [$t_1 in T$],
          [iszero $t_1 in T$]
        )
      ][][
        #myproof(
          [$t_1,t_2,t_3 in T$],
          [if $t_1$ then $t_2$ else $t_3$]
        )
      ]
  ]
]

#definition_block()[
  === Concrete Procedural definition of the language

  $
    S_0 &= emptyset \
    S_(i+1) &= {"true","false",0} \
            &  union {"succ " t_1, "pred " t_1, "iszero " t_1 | t_1 in S_i} \
            &  union {"if " t_1 "then" t_2 "else" t_3 | t_1,t_2,t_3 in S_i} \
    S &= union.big_i S_i
  $
]

==== Exercice 
How many elements does $S_3$ have? 

===== Answer
$S_0$ contains 0 elements (emptyset) \
$S_1$ contains 3 elements (constants) \
$S_2$ contains 39 elements (3 from constants, $3*3=9$ from univariable functions, $3^3=27$ from all the combinations of ifelse) \
we can guess that $abs(S_(n+1)) = 3 + abs(S_n) times 3 + abs(S_n)^3$ has \
so $S_3$ contains 59439 elements


==== Exercice
Showing that forall $i$, $S_i subset.eq S_(i+1)$ 

===== Answer
from the previous exercice we have $abs(S_(n+1)) = 3 + abs(S_n) times 3 + abs(S_n)^3$  since $abs(S_n)$ is always positve then it is trivial
