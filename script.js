const body = document.getElementsByTagName("ul")[0];

const filesnames = [
  "AlgebraChapter0",
  "CategoryTheoryForProgrammers",
  "colorExplanation",
  "ComputationTheory",
  "ModelTheory",
  "TypesAndProgrammingLanguages",
]


let body_content = filesnames.map(f => `<li>
    <a href="./${f}.pdf">${f.replace(/([A-Z])/g, ' $1').trim()}</a>
  </li>`)
     .join("")

body.innerHTML = body_content
