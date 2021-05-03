const { PrismaClient } = require('@prisma/client')
const cursos = require('./meuscursos')

async function main() {



  for (let curso of cursos) {
    await prisma.cursos.create({
      data: curso
    })  
  }

  main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
  
}
