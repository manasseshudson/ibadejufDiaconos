const express = require('express');
const app = express();
const bodyParser = require('body-parser')
const { Knex } = require('knex');
const knex = require('./database/database');
const base64 = require('base-64');
const uniqid = require('uniqid'); 
const uid2 = require('uid2');
const router = express.Router();

const title = 'IBADEJUF EAD'
const title_adm ="";

router.get('/user/player/:id_materia/:uid_usuario',(req,res)=>{
	const { id_materia, uid_usuario } = req.params;
	
	knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).select().then(materia=>{
				
				knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).andWhere({id_materia: id_materia}).select().then(nome_materia=>{
					//console.log(materia)
					knex('tb_aulas').where({ id_modulo: aluno[0].id_modulo}).andWhere({id_materia: id_materia }).limit(35).orderBy('ordem').select().then(aulas=>{
						//console.log(aulas)
						res.render('user/playerNovo',{
							aulas,
							qtdeMateriasDisponiveis: materia.length ,
							qtdeAulasDisponiveis: aulas.length ,
							qtdeAulasAssistidas: aulas.length ,
							materia,
							id_materia: nome_materia[0].id_materia,
							nome_materia: nome_materia[0].descricao,
							logo: 'IBADEJUF',
							id_aluno: result_user[0].id_aluno,
							title,
							user: aluno[0].nome,
							uid_usuario,
							botao_concluir_aula:true
						})					
					})					
				})
			})
        }) 
    })
})



router.get('/user/principal/:uid_usuario', (req,res)=>{ 
    const { uid_usuario } = req.params;

    knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{			
			knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).select().then(materia=>{
				knex('tb_aulas').where({ id_modulo: aluno[0].id_modulo}).select().then(aulas=>{
					knex('tb_presenca_aula_aluno').where({id_aluno: result_user[0].id_aluno}).count('id_presenca_aula_aluno as qtde').select().then(presenca=>{
						
						
						console.log('Qtde Materias '+materia.length)
						console.log('Qtde Aulas '+aulas.length)
						console.log('Aulas Assistidas '+presenca[0].qtde)
						
						res.render('user/principal',{
							qtdeMateriasDisponiveis: materia.length ,
							qtdeAulasDisponiveis: aulas.length ,
							qtdeAulasAssistidas: presenca[0].qtde ,
							materia,
							logo: 'IBADEJUF',
							id_aluno: result_user[0].id_aluno,
							title,
							user: aluno[0].nome,
							uid_usuario
						})		
					})
					
							
				})
			})
        }) 
    })
    
})

router.get('/user/materias/:uid_usuario', (req,res)=>{ 
    const { uid_usuario } = req.params;

	console.log(uid_usuario)
    knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			
			knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).select().then(materia=>{
				knex('tb_aulas').where({ id_modulo: aluno[0].id_modulo}).select().then(aulas=>{
				
					res.render('user/aulas',{
						qtdeMateriasDisponiveis: materia.length ,
						qtdeAulasDisponiveis: aulas.length ,
						qtdeAulasAssistidas: aulas.length ,
						materia,
						logo: 'IBADEJUF',
						id_aluno: result_user[0].id_aluno,
						title,
						user: aluno[0].nome,
						uid_usuario
					})
				
				})
			})
        }) 
    })
    
})


router.get('/user/aulas/:id_materia/:uid_usuario', (req,res)=>{ 
	const { id_materia, uid_usuario } = req.params;

	res.send(id_materia + '-'+ uid_usuario )
})/*
router.get('/user/aulas/:uid_usuario', (req,res)=>{ 
    const { uid_usuario } = req.params;
    //id = base64.decode(id);
    knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({ id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
            knex('vw_principal_user').where({id_modulo: aluno[0].id_modulo}).orderBy('id_aulas').select().then(aulas=>{   
			
				
					
					//console.log(aulas[0].presenca)
					
				
					if(aulas.length >0){
						_link=aulas[0].link;
					}else{
						_link="";
						
					}
					
					
					res.render('user/aulas',{
						aluno: aluno[0].id_aluno,
						aula: aulas,
						link: _link,
						logo: 'IBADEJUF',
						id_aluno: result_user[0].id_aluno,
						title,
						user: aluno[0].nome,
						uid_usuario,
						presenca: 0
					})
						
			
               
            })
        })
    })
})
*/

router.get('/user/videos/:id_aulas/:uid_usuario',(req,res)=>{
    const { id_aulas, uid_usuario } = req.params;
    

    knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
		knex('tb_aluno').where({ id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			knex('vw_principal_user').where({id_aulas: id_aulas}).select().then(result=>{				
				knex('vw_principal_user').where({id_modulo: aluno[0].id_modulo}).select().then(aulas=>{
					
					knex('vw_principal_user').where({id_aulas: id_aulas}).select().then(aulas_presenca=>{
						console.log(aulas_presenca);
						
						res.render('user/videos',{
							aula: result,
							link: result[0].link,
							aulas,
							logo: 'IBADEJUF',
							id_aluno: result_user[0].id_aluno,
							title,
							user: result_user[0].nome,
							uid_usuario,
							presenca: aulas_presenca[0].presenca
						})
					})
				})
			})
        })
    })
})

router.get('/user/profile/:uid_usuario',(req,res)=>{
    const { uid_usuario } = req.params;
    knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(dados=>{
			//console.log(dados)
            knex('tb_modalidade').where({id_modalidade: dados[0].id_modalidade}).select().then(modalidades=>{
                //knex("tb_modulo").select().then((modulo) => {
					knex("tb_modulo").where({id_modulo: dados[0].id_modulo}).select().then((modulo) => {
						
						res.render("user/profile", {
                        logo: 'IBADEJUF',
                        title_page: title_adm,
                        abrir_aviso: false,
                        abrir_aviso_opcao: "danger",
                        mensagem_modal: "Aluno já cadastrado",
						descricao_modulo:  modulo[0].descricao,
						descricao_modalidade: modalidades[0].descricao,
                        //modulo: modulo,
                        //modalidade: modalidades,
                        Aluno: dados,
						nomeAluno: dados[0].nome,
                        title,
                        user: dados[0].nome,
                        uid_usuario,
                        abrir_aviso: true,
                        mensagem_modal: 'Dados Alterad com sucesso',
                        tempo_modal:2
                    });  
					})
					
					
					
                    
					
                //});
            })	
        })
    })
})

router.post("/user/editProfile", (req, res) => {
    const {nome, email,cpf_alteracao, rg, nascimento, 
            nome_pai, nome_mae,escolaridade, 
            profissao,denominacao,batismo_aguas,telefone ,
            naturalidade, cep, endereco, numero, complemento,
            bairro, cidade, uf, id_modulo, id_modalidade, uid_usuario} = req.body;

        //console.log(cpf_alteracao)
    try{
        knex("tb_aluno").where({ cpf: cpf_alteracao }).select().then((result) => {
                knex("tb_aluno").where({cpf: cpf_alteracao})
                    .update({
                        nome: nome,
                        email: email,
                        cpf: cpf_alteracao,
                        rg: rg,
                        data_nascimento: nascimento,
                        nome_pai: nome_pai,
                        nome_mae: nome_mae,
                        natural: naturalidade,
                        escolaridade: escolaridade,
                        profissao: profissao,	
                        denominacao: denominacao,
                        batismo_aguas: batismo_aguas,
                        endereco_cep: cep,
                        endereco_rua: endereco,
                        endereco_numero: numero,
                        endereco_complemento: complemento,
                        endereco_bairro: bairro,
                        endereco_cidade: cidade,
                        endereco_uf: uf,
                        endereco_telefone: telefone,
                        endereco_celular: telefone,
                        observacao: "",
                        status: "0",
                        id_modulo: id_modulo,
                        id_modalidade: id_modalidade
                })
                .then((result) => {
					res.send('Dados alterados com Sucesso')
                    console.log('Dados alterados com Sucesso')
                    //res.redirect('/user/principal/'+uid_usuario)
                });
        
      });
    } catch (error) {
        console.log(error)
        res.redirect('/user/profile/'+uid_usuario)
    } 
});

router.post('/user/marcar_presenca/',(req,res)=>{
    let  uid_usuario   = req.body.uid_usuario;
    let  id_aula   = req.body.id_aula;

	knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result=>{
		let id_aluno = result[0].id_aluno;
		
		knex('tb_presenca_aula_aluno').insert({
			id_aluno: id_aluno,
			id_aula: id_aula
		}).then(result=>{
			console.log('presenca marcada ')
			res.send('Aula Concluida com Sucesso')
		})

		
	})

    

    //res.redirect('/user/aulas/'+id_aluno)
})


router.get('/user/aulas_materia/:id_materia/:uid_usuario',(req,res)=>{
	const { id_materia, uid_usuario } = req.params;
	
	knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).select().then(materia=>{
				
				knex('tb_materia').where({ id_modulo: aluno[0].id_modulo}).andWhere({id_materia: id_materia}).select().then(nome_materia=>{
					//console.log(materia)
					knex('tb_aulas').where({ id_modulo: aluno[0].id_modulo}).andWhere({id_materia: id_materia }).limit(35).orderBy('ordem').select().then(aulas=>{
						console.log(aulas)
						res.render('user/aulas_materia',{
							aulas,
							qtdeMateriasDisponiveis: materia.length ,
							qtdeAulasDisponiveis: aulas.length ,
							qtdeAulasAssistidas: aulas.length ,
							materia,
							id_materia: nome_materia[0].id_materia,
							nome_materia: nome_materia[0].descricao,
							logo: 'IBADEJUF',
							id_aluno: result_user[0].id_aluno,
							title,
							user: aluno[0].nome,
							uid_usuario
						})					
					})					
				})
			})
        }) 
    })
})

router.get('/user/aulas_materia_visualizar/:id_materia/:uid_usuario/:id_aula',(req,res)=>{
	const { id_aula, id_materia, uid_usuario } = req.params;
	
	knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			knex('tb_aulas').where({ id_aulas: id_aula}).select().then(aulas=>{
				knex('tb_materia').where({ id_materia: id_materia}).select().then(materia=>{
					knex('tb_presenca_aula_aluno').where({ id_aula: id_aula}).andWhere({id_aluno: aluno[0].id_aluno}).select().then(presenca=>{
						console.log(presenca)
						if(presenca.length=="0"){
							res.render('user/aulas_materia_visualizar',{
								aulas,
								botao_concluir_aula: true,
								link: aulas[0].link,
								nome_aula: aulas[0].descricao,
								id_aula: aulas[0].id_aulas,
								nome_materia: materia[0].descricao,
								id_materia: materia[0].id_materia,
								logo: 'IBADEJUF',
								id_aluno: result_user[0].id_aluno,
								title,
								user: aluno[0].nome,
								uid_usuario
							})			
						}else{
							res.render('user/aulas_materia_visualizar',{
								aulas,
								botao_concluir_aula: false,
								link: aulas[0].link,
								nome_aula: aulas[0].descricao,
								id_aula: aulas[0].id_aulas,
								nome_materia: materia[0].descricao,
								id_materia: materia[0].id_materia,
								logo: 'IBADEJUF',
								id_aluno: result_user[0].id_aluno,
								title,
								user: aluno[0].nome,
								uid_usuario
							})	
							
						}
						
						
						
					})
					
									
				})
			})	
        }) 
    })
})



router.post('/user/presenca/',(req,res)=>{
	const {id_aula, uid_usuario }= req.body;
	
	
	return;
	knex('tb_usuario').where({uid_usuario: uid_usuario}).select().then(result_user=>{
        knex('tb_aluno').where({id_aluno: result_user[0].id_aluno}).select().then(aluno=>{
			
			knex('tb_presenca_aula_aluno').insert({
				id_aluno: aluno[0].id_aluno,
				id_aula : id_aula				
			}).then(result=>{
				console.log(uid_usuario);
				res.send('presencao ok')				
			})
			
			
		})		
	})
	
	
	
	
	
})

module.exports = router;