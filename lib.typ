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
  important_block([#body],aqua,black)
} 

#let theorem_block(body) = {
  important_block([#body],rgb("#d3f0a8"),black)
}

#let proof_block(body) = {
  important_block([#body],rgb("#f1807e"),black)
}

#let incomplete_proof_block(body) = {
  important_block([#body],gray,black)
}
