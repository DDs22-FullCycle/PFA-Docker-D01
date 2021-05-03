const { response } = require('express')
const express = require('express')
const app = express()

const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()




app.get('/', (req, res) => {
    
    main().then((result) => {

      
      var retorno = `<h2> Douglas dos Santos </h2>
                     <h1> Lista de Cursos FullCycle: </h1>`
          for (const iterator of result) {
            retorno += "<h3><li>"+ iterator + "</li></h3>"   
          }

      return res.send(

        //{
          
          retorno
          

        //}
        
      )

    }).catch((err) => {
      
    })

})

app.listen(3000, ()=> {
    console.log("Rodando naca porta "+ app)
})


async function main() {
    const allCadastros = await prisma.cadastro.findMany()
     //prisma.user.findMany()
     //console.log(allCadastros)

     var lista = [];
     for (const key in allCadastros) {
       if (Object.hasOwnProperty.call(allCadastros, key)) {
         const element = allCadastros[key].CadastroName;
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