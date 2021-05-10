import { PrismaClient } from '@prisma/client'
import express from "express"

const app = express()
const prisma = new PrismaClient()

app.get('/', (req, res) => {

    main().then((result) => {

      var retorno = `<h2> Douglas dos Santos </h2>
                     <h1> Lista de Cursos FullCycle: </h1>`
          for (const iterator of result) {
            retorno += "<h3><li>"+ iterator + "</li> </h3>"   
          }

      return res.send(retorno)

    }).catch((err) => {
      
    })

})

app.listen(3000, ()=> {
    console.log("Rodando na porta : 3000")
})

async function main() {
    const cursos = await prisma.cursos.findMany()

     var lista = [];
     for (const key in cursos) {
       if (Object.hasOwnProperty.call(cursos, key)) {
         const element = cursos[key].cursoName;
         lista.push(element)
       }
     }

    return lista
}

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
  
  export default prisma