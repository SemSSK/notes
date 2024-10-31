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

#let remark(body) = {
  text(style:"italic")[
    *Remark: *#body
  ]
} 

#outline


= Structures and Theories

== Language and Structures

#definition_block()[
  === Definition
  a language $cal(L)$ is defined by the following data
  1. a set of functions $cal(F)$ and positive integers $n_f$ foreach $f in cal(F)$ which is the arity of each function
  2. a set of relations $cal(R)$ and positive integers $n_R$ foreach $R in cal(R)$ which is the arity of each relation 
  3. a set of constant symbols $cal(C)$

  all sets can be empty
]

=== Examples

1. the language of rings $cal(L)_r = {plus, minus,dot,0,1}$
2. the language of ordered rings $cal(L)_(o r) = cal(L)_r union {lt}$
3. the language of pure sets $cal(L) = emptyset$
4. the language of graphs $cal(L) = {R}$ where $R$ is a binary relation

#remark()[Seems to me that it resembles a lot the conçept of an abstract interface in programming languages like: Interfaces in Java, Traits in Rust, Typeclasses in Haskell, Conçepts in C++]


#definition_block()[
  === Definition
  An $cal(L)$-structure $cal(M)$ is given by the following data:
  1. a non empty set $M$ called universe/domain/underlying set of $cal(M)$
  2. a function $f^cal(M) : M^(n_f) arrow M$ for each $f in cal(F)$
  3. a set $R^cal(M) subset.eq M^(n_R)$ for each $R in cal(R)$
  4. an element $c^cal(M) in M$ for each $c in cal(C)$

  the last 3 are called interpretations of their counterpart 
]

$cal(M)$ is generaly given by a tuple of its components

=== Examples

for example we have the language of groups being $cal(L)_g = {dot,e}$. an $cal(L)$-structure $G = (RR,dot,1)$ or even $G = (ZZ,plus,0)$


#remark()[
  This in turn looks to me like the implementation of the structure in programming languages
]


#definition_block()[
  === Definition
  suppose $cal(M),cal(N)$ are structures of $cal(L)$ with universes $M, N$, an $cal(L)$-embedding $eta: cal(M) arrow cal(N)$ is a one-to-one embedding map $eta: M arrow N$ that preserves structure as follows:
  1. $eta(f^cal(M)(a_1,...,a_n)) = f^cal(N)(eta(n_1),...,eta(n_n))$
  2. $(a_1,....,a_m) in R^cal(M)$ iff $(eta(a_1),...,eta(a_m)) in R^cal(N)$
  3. $eta(n^cal(M)) = c^eta(N)$

  some special cases:
  - a bijective $cal(L)$-embedding is callend an $cal(L)$-isomorphism.
  - if $M subset.eq N$ and inclusion map is an $cal(L)$-embedding then $cal(M)$ is a substructure of $cal(N)$ and $cal(N)$ is an extension of $cal(M)$
]

=== Examples

if $eta: ZZ arrow RR$ is $eta(x) = e^x$ then it is $cal(L)$-embedding of $(ZZ,plus,0)$  into $(R,dot,1)$


#definition_block()[
  === Definition
  $cal(L)$-terms is the smallest set $cal(T)$ such that 
  1. $forall c in cal(C), c in cal(T)$  
  2. each variable symbol $v_i in cal(T)$ for $i in NN^*$
  3. if $t_1,...,t_n in cal(T)$ and $f in cal(F)$ then $f(t_1,...,t_n) in cal(T)$ 
]

=== Examples 

for $cal(L)_r$ (ring language) we have $dot (v_1, -(v_3,1))$ and $+(1,+(1,+(1,1)))$ this example is written in S-expressions like lisp but it works with infix 

#remark()[
  this also is exactly the same thing as defining what is a valid term in programming languages
]


