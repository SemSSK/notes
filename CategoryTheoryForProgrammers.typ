#import "lib.typ": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
 
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

#let compose = $circle.tiny$


#outline()

= Category theory basics 
#definition_block()[
  == Definition
  a Category is a collection of arrows called *morphisms* and dots called *objects* with these conditions:
  1. $f: A arrow B and g: B arrow C$ then there exist $g circle.tiny f: A arrow C$ called the composition of $f$ with $g$
    - composition is *associative*
  2. forall object A in a category there is a morphism $"id":A arrow.long A$ such that $ "id"_B compose f = f$ and $g compose "id"_A = g$ its the identity morphism 
]

== Examples

1. *the empty category:* no objects and no morphisms
2. a one object category with only identity morphisms
3. multiple objects only identity morphisms
4. *Set:* sets as objects and functions as morphisms 
5. *Vect:* vector spaces as objects and linear maps as morphisms
6. *Hask:* haskell types as objects and fuctions as morphisms

#definition_block()[
  == Definition
  a morphism $f:A arrow B$ is an isomorphism if there exists $g:B arrow A$ such that $f compose g = "id"_B and g compose f = "id"_A$
]

#definition_block()[
  == Definition
  an object $O$ in a category $C$ is terminal iff $forall A in C, exists!f:A arrow O$
]

== Examples
1. the set with 1 element in *Set*
2. the Unit type in *Hask*


