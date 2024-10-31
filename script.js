const body = document.getElementsByTagName("ul")[0];

const filesnames = [
  "AlgebraChapter0",
  "CategoryTheoryForProgrammers",
  "colorExplanation",
  "ComputationTheory",
  "lib",
  "ModelTheory",
  "TypesAndProgrammingLanguages",
]


let body_content = files.map(f => `<li>
    <a href="./${f}.pdf">${f}</a>
  </li>`)
     .join("")

 
body.innerHTML = body_content
