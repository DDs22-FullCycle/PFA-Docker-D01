const { response } = require('express')
const express = require('express')
const app = express()

const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()



app.get('/', (req, res) => {
    
    main().then((result) => {
      return res.send( 
        result 
      )

    }).catch((err) => {
      
    })

})

app.listen(3000, ()=> {
    console.log("Rodando na porta "+ app)
})


async function main() {
    const allCadastros = await prisma.cadastro.findMany()
     //prisma.user.findMany()
     //console.log(allCadastros)
    return allCadastros
}

main()
  .catch(e => {
    throw e
  })
  .finally(async () => {
    await prisma.$disconnect()
  })