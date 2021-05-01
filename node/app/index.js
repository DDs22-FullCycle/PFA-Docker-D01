const { response } = require('express')
const express = require('express')
const app = express()

app.get('/', (req, res) => {
    res.send('asdasssssssssssssssd')
})

app.listen(3000, ()=> {
    console.log("Rodando na porta "+ app)
})