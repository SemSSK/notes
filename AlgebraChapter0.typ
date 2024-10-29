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


= Set Theory And Categories

== Naive Set Theory

the book does not provide a formal definition of sets which makes sense as it is too advanced for chapter 0 but says how we write sets :

- As their elements : $E = {1,2,3}$ works for finite sets 
- As an easily understood pattern : $E = {0,2,4,...}$ works for infinite sets
- Describing how we construct them : $A = {s in S | s "satisfies" P}$

also sets don't care about repetion so: ${1,2} equiv {1,2,1}$ the ones that care a called multiset

unsuprisingly the author agrees with me in that the most popular sets are the number sets with the empty set: $emptyset, NN, ZZ, QQ, RR, CC$

TODO:define singletons


#definition_block()[
  === Set inclusion

  $S subset.eq T arrow.l.r.long.double (forall s in S arrow.double s in T)$ \
  $S subset T arrow.l.r.long.double (forall s in S arrow.double s in T and exists t in T, t in.not S)$ \
  also forall sets $S$ $emptyset subset.eq S$ and $S subset.eq S$
]

#definition_block()[
  === Operations on sets
  - union $union$
  - intersection $sect$
  - difference $backslash$
  - disjoint union $product.co$ this correponds to tagged unions or in Rust to enums  
  - carthesian product $times$
  - "quotient by an equivalence relation"
]


#definition_block()[
  === Equivalence relation definition
  a relation is an equivalence relation iff:
  - reflexivity: $(forall a in S) a tilde a$
  - symmetry: $(forall a, b in S) a tilde b arrow.double b tilde a$
  - transitivity: $(forall a,b,c in S) a tilde b and b tilde c arrow.double a tilde c$
]



=== Exercices
1. done
2.
3. $forall a,b in S, a tilde b arrow.double exists S_p in P, a,b in S_p $
4. as many as the number of partions if they are equivalent so bell number so 5
5. $a tilde b arrow.double $ $a$ lives 1km away from $b$ if you build a partition sets you will get non disjoint sets 
6.
