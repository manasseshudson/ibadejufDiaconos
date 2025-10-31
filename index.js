
const express = require('express');
const app = express();
const bodyParser = require('body-parser')
const { Knex } = require('knex');
const knex = require('./database/database');
const base64 = require('base-64');
const uniqid = require('uniqid'); 
const uid2 = require('uid2');
//const cookieParser = require('cookie-parser');
//router.use(cookieParser());
const youtubeThumbnail = require('youtube-thumbnail'); 

const Recipient = require("mailersend").Recipient;
const EmailParams = require("mailersend").EmailParams;
const MailerSend = require("mailersend");
const path = require('path');
/*

*/

const cors = require('cors');

require('dotenv').config();
app.use(cors());

app.set('view engine', 'ejs');
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));


app.use((req, res, next) => {
	//Qual site tem permissão de realizar a conexão, no exemplo abaixo está o "*" indicando que qualquer site pode fazer a conexão
    res.header("Access-Control-Allow-Origin", "*");
	//Quais são os métodos que a conexão pode realizar na API
    res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
    app.use(cors());
    next();
});

const title = 'IBADEJUF EAD'
const title_adm = ""

const login = require('./login');
const user = require('./user');
const adm = require('./adm');
const admNucleo = require('./admNucleo');

app.use('/',login);
app.use('/',user);
app.use('/',adm);
app.use('/',admNucleo);

app.get('/', (req,res)=>{ 
    //res.redirect('/login')
	res.redirect('loginv2')
	//res.render('index')
})

app.get('/loginv2', (req,res)=>{ 
    //res.redirect('/login')
	res.render('loginv2',{
		title,
		abrir_aviso: false,
		mensagem_modal: 'Usuário ou Senha Inválidos' ,
		tempo_modal :6000,
		title
	})
})


app.get('/uid', (req,res)=>{ 
    res.send(uid2(10))
    //res.redirect('/login')
})

app.get('/:watchCode' , (req , res) => { 
    var watchCode = req.params.watchCode; 
    var url = `https://www.youtube.com/watch?v=${watchCode}`; 

    let link = 'https://www.youtube.com/embed/YcH2kxqK3nc?si=APghYqtOvdCSF0hl'
    let inicio =link.indexOf("embed/")+6;
    let fim = link.indexOf("?si")

    var link_novo = link.substring(inicio,fim)
    ///console.log('http://img.youtube.com/vi/'+link_novo+'/hqdefault.jpg');
    var img = 'http://img.youtube.com/vi/GAqUmUSg_WM/hqdefault.jpg'


    var data = youtubeThumbnail(url); 
    var thumbnail = data.high.url; 
    //console.log(thumbnail)
    res.send(`
    <a href="user/aulas/1"><img src="${img}"/></a>
    <p>Estratégias de autenticação entre front-end e back-end com JWT (cookies storage)</p>
    `); 
    //res.send(`<img src="${thumbnail}" alt="Thumbnail" />`); 

    //https://www.youtube.com/watch?v=MFVVYaH9er4
    //<iframe width="560" height="315" src="https://www.youtube.com/embed/MFVVYaH9er4?si=zn2Ig9Qtwxjy_9xZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>



}); 


app.get('/base64decode/:dados' , (req , res) => { 
    const { dados } = req.params;

    res.send(base64.decode(dados))

}); 


app.listen( 3015,()=>{
	console.log('Api Rodando porta  3015')
})


