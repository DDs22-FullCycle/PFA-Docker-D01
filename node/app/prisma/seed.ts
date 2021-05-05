import { cursos } from './meuscursos';
import { prisma } from '@prisma/client';



async function main(){

  console.log('teste1')
  console.log(cursos)

  // for (const iterator of cursos) {
  //   const teste = await prisma.cursos.upsert({
  //     data: iterator
  //   })  
  //   console.log(teste)
  // }

  for (let curso of cursos) {
    //console.log(curso)
    const teste = await prisma.cursos.upsert({
      data: curso
    })  
    //console.log(teste)
  }
  //console.log('teste2')
  return null;
  
}

main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
