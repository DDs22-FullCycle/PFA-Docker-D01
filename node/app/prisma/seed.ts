import { cursos } from './meuscursos';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();


async function main(){

  console.log('teste1')
  console.log(cursos)

  for (let curso of cursos) {
    //console.log(curso)
    const teste = await prisma.cursos.create({
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
