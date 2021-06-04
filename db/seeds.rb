# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create! nome: 'admin', email: 'admin@agile.br', password: '12345678', password_confirmation: '12345678'


#Curso.create! nome: 'Curso de Lógica de Programação', descricao: 'Descrição do curso.', data_inicio: '01/01/2019', hora_inicio: '08:00:00', data_termino: '01/01/2020', hora_termino: '23:59:59', codigo_acesso: '12345678', ativo: true, publico: true, tema_curso_id: 1, proprietario_id: 2
#Modulo.create! nome: 'Módulo 1', descricao: "Primeiro módulo do curso", publico: true, curso_id: 1
#Forum.create! titulo: 'Fórum teste', descricao: 'Criação de fórum de teste', curso_id: 1, usuario_curso_id: 1
#SalaChat.create! nome: 'Sala de teste', curso_id: 1, usuario_curso_id: 1, ativo: true
#Missao.create! curso_id: 1, usuario_curso_id: 1, nome: "Primeira missão", descricao: "Faça X coisas.", ativo:true


@tema_curso = TemaCurso.new nome: 'Padrão', ativo: true, cor_titulo: '#1C2AD2', cor_texto: '#2E40EB', cor_fundo: '#1D50E3'
@tema_curso.imagem.attach(io: File.open('app/assets/images/backgrounds/background_mystic.jpg'), filename: 'estrela.jpg')
@tema_curso.save!

#Grupos
@grupo1 = Grupo.new nome: 'Magos', ativo: true, perfil: 'Aluno'
@grupo1.imagem.attach(io: File.open('app/assets/images/grupos/grupo_mago.jpg'), filename: 'estrela.jpg')
@grupo1.save!

@grupo2 = Grupo.new nome: 'Elfos', ativo: true, perfil: 'Aluno'
@grupo2.imagem.attach(io: File.open('app/assets/images/grupos/grupo_elfo.jpg'), filename: 'estrela.jpg')
@grupo2.save!

@grupo3 = Grupo.new nome: 'Guerreiros', ativo: true, perfil: 'Aluno'
@grupo3.imagem.attach(io: File.open('app/assets/images/grupos/grupo_guerreiro.jpg'), filename: 'estrela.jpg')
@grupo3.save!

@grupo4 = Grupo.new nome: 'Oráculos', ativo: true, perfil: 'Professor'
@grupo4.imagem.attach(io: File.open('app/assets/images/grupos/grupo_oraculo.jpg'), filename: 'estrela.jpg')
@grupo4.save!

#Avatares
#Magos
@avatar_maga1 = Avatar.new grupo_id: 1, nome: 'Maga', perfil: 'Aluno', ativo: true
@avatar_maga1.imagem.attach(io: File.open('app/assets/images/avatares/maga1.png'), filename: 'estrela.jpg')
@avatar_maga1.save!

@avatar_maga2 = Avatar.new grupo_id: 1, nome: 'Maga', perfil: 'Aluno', ativo: true
@avatar_maga2.imagem.attach(io: File.open('app/assets/images/avatares/maga2.png'), filename: 'estrela.jpg')
@avatar_maga2.save!

@avatar_maga3 = Avatar.new grupo_id: 1, nome: 'Maga', perfil: 'Aluno', ativo: true
@avatar_maga3.imagem.attach(io: File.open('app/assets/images/avatares/maga3.png'), filename: 'estrela.jpg')
@avatar_maga3.save!

@avatar_mago1 = Avatar.new grupo_id: 1, nome: 'Mago', perfil: 'Aluno', ativo: true
@avatar_mago1.imagem.attach(io: File.open('app/assets/images/avatares/mago1.png'), filename: 'estrela.jpg')
@avatar_mago1.save!

@avatar_mago2 = Avatar.new grupo_id: 1, nome: 'Mago', perfil: 'Aluno', ativo: true
@avatar_mago2.imagem.attach(io: File.open('app/assets/images/avatares/mago2.png'), filename: 'estrela.jpg')
@avatar_mago2.save!

@avatar_mago3 = Avatar.new grupo_id: 1, nome: 'Mago', perfil: 'Aluno', ativo: true
@avatar_mago3.imagem.attach(io: File.open('app/assets/images/avatares/mago3.png'), filename: 'estrela.jpg')
@avatar_mago3.save!

#Elfos
@avatar_elfa1 = Avatar.new grupo_id: 2, nome: 'Elfa', perfil: 'Aluno', ativo: true
@avatar_elfa1.imagem.attach(io: File.open('app/assets/images/avatares/elfa1.png'), filename: 'estrela.jpg')
@avatar_elfa1.save!

@avatar_elfa2 = Avatar.new grupo_id: 2, nome: 'Elfa', perfil: 'Aluno', ativo: true
@avatar_elfa2.imagem.attach(io: File.open('app/assets/images/avatares/elfa2.png'), filename: 'estrela.jpg')
@avatar_elfa2.save!

@avatar_elfa3 = Avatar.new grupo_id: 2, nome: 'Elfa', perfil: 'Aluno', ativo: true
@avatar_elfa3.imagem.attach(io: File.open('app/assets/images/avatares/elfa3.png'), filename: 'estrela.jpg')
@avatar_elfa3.save!

@avatar_elfo1 = Avatar.new grupo_id: 2, nome: 'Elfo', perfil: 'Aluno', ativo: true
@avatar_elfo1.imagem.attach(io: File.open('app/assets/images/avatares/elfo1.png'), filename: 'estrela.jpg')
@avatar_elfo1.save!

@avatar_elfo2 = Avatar.new grupo_id: 2, nome: 'Elfo', perfil: 'Aluno', ativo: true
@avatar_elfo2.imagem.attach(io: File.open('app/assets/images/avatares/elfo2.png'), filename: 'estrela.jpg')
@avatar_elfo2.save!

@avatar_elfo3 = Avatar.new grupo_id: 2, nome: 'Elfo', perfil: 'Aluno', ativo: true
@avatar_elfo3.imagem.attach(io: File.open('app/assets/images/avatares/elfo3.png'), filename: 'estrela.jpg')
@avatar_elfo3.save!


#Guerreiros
@avatar_guerreira1 = Avatar.new grupo_id: 3, nome: 'Guerreira', perfil: 'Aluno', ativo: true
@avatar_guerreira1.imagem.attach(io: File.open('app/assets/images/avatares/guerreira1.png'), filename: 'estrela.jpg')
@avatar_guerreira1.save!

@avatar_guerreira2 = Avatar.new grupo_id: 3, nome: 'Guerreira', perfil: 'Aluno', ativo: true
@avatar_guerreira2.imagem.attach(io: File.open('app/assets/images/avatares/guerreira2.png'), filename: 'estrela.jpg')
@avatar_guerreira2.save!

@avatar_guerreira3 = Avatar.new grupo_id: 3, nome: 'Guerreira', perfil: 'Aluno', ativo: true
@avatar_guerreira3.imagem.attach(io: File.open('app/assets/images/avatares/guerreira3.png'), filename: 'estrela.jpg')
@avatar_guerreira3.save!

@avatar_guerreiro1 = Avatar.new grupo_id: 3, nome: 'Guerreiro', perfil: 'Aluno', ativo: true
@avatar_guerreiro1.imagem.attach(io: File.open('app/assets/images/avatares/guerreiro1.png'), filename: 'estrela.jpg')
@avatar_guerreiro1.save!

@avatar_guerreiro2 = Avatar.new grupo_id: 3, nome: 'Guerreiro', perfil: 'Aluno', ativo: true
@avatar_guerreiro2.imagem.attach(io: File.open('app/assets/images/avatares/guerreiro2.png'), filename: 'estrela.jpg')
@avatar_guerreiro2.save!

@avatar_guerreiro3 = Avatar.new grupo_id: 3, nome: 'Guerreiro', perfil: 'Aluno', ativo: true
@avatar_guerreiro3.imagem.attach(io: File.open('app/assets/images/avatares/guerreiro3.png'), filename: 'estrela.jpg')
@avatar_guerreiro3.save!

#Oraculos
@avatar_oracula1 = Avatar.new grupo_id: 4, nome: 'Orácula', perfil: 'Professor', ativo: true
@avatar_oracula1.imagem.attach(io: File.open('app/assets/images/avatares/oracula1.png'), filename: 'estrela.jpg')
@avatar_oracula1.save!

@avatar_oracula2 = Avatar.new grupo_id: 4, nome: 'Orácula', perfil: 'Professor', ativo: true
@avatar_oracula2.imagem.attach(io: File.open('app/assets/images/avatares/oracula2.png'), filename: 'estrela.jpg')
@avatar_oracula2.save!

@avatar_oraculo1 = Avatar.new grupo_id: 4, nome: 'Oráculo', perfil: 'Professor', ativo: true
@avatar_oraculo1.imagem.attach(io: File.open('app/assets/images/avatares/oraculo1.png'), filename: 'estrela.jpg')
@avatar_oraculo1.save!

@avatar_oraculo2 = Avatar.new grupo_id: 4, nome: 'Oráculo', perfil: 'Professor', ativo: true
@avatar_oraculo2.imagem.attach(io: File.open('app/assets/images/avatares/oraculo2.png'), filename: 'estrela.jpg')
@avatar_oraculo2.save!

#Níveis
@nivel1 = Nivel.new nome: 'Nível 1', pontos_requeridos: 0
@nivel1.imagem.attach(io: File.open('app/assets/images/niveis/nivel1.png'), filename: 'estrela.jpg')
@nivel1.save!

@nivel2 = Nivel.new nome: 'Nível 2', pontos_requeridos: 50
@nivel2.imagem.attach(io: File.open('app/assets/images/niveis/nivel2.png'), filename: 'estrela.jpg')
@nivel2.save!

@nivel3 = Nivel.new nome: 'Nível 3', pontos_requeridos: 100
@nivel3.imagem.attach(io: File.open('app/assets/images/niveis/nivel3.png'), filename: 'estrela.jpg')
@nivel3.save!

@nivel4 = Nivel.new nome: 'Nível 4', pontos_requeridos: 150
@nivel4.imagem.attach(io: File.open('app/assets/images/niveis/nivel4.png'), filename: 'estrela.jpg')
@nivel4.save!

@nivel5 = Nivel.new nome: 'Nível 5', pontos_requeridos: 200
@nivel5.imagem.attach(io: File.open('app/assets/images/niveis/nivel5.png'), filename: 'estrela.jpg')
@nivel5.save!

@nivel6 = Nivel.new nome: 'Nível 6', pontos_requeridos: 250
@nivel6.imagem.attach(io: File.open('app/assets/images/niveis/nivel6.png'), filename: 'estrela.jpg')
@nivel6.save!

##Badges
@badge1 = Badge.new nome: 'Aprendiz', ativo: true, pontos_requeridos: 10
@badge1.imagem.attach(io: File.open('app/assets/images/badges/badge1.png'), filename: 'estrela.jpg')
@badge1.save!

@badge2 = Badge.new nome: 'Aspirante', ativo: true, pontos_requeridos: 60
@badge2.imagem.attach(io: File.open('app/assets/images/badges/badge2.png'), filename: 'estrela.jpg')
@badge2.save!

@badge3 = Badge.new nome: 'Especialista', ativo: true, pontos_requeridos: 110
@badge3.imagem.attach(io: File.open('app/assets/images/badges/badge3.png'), filename: 'estrela.jpg')
@badge3.save!

@badge4 = Badge.new nome: 'Perito', ativo: true, pontos_requeridos: 160
@badge4.imagem.attach(io: File.open('app/assets/images/badges/badge4.png'), filename: 'estrela.jpg')
@badge4.save!

@badge5 = Badge.new nome: 'Mestre', ativo: true, pontos_requeridos: 210
@badge5.imagem.attach(io: File.open('app/assets/images/badges/badge5.png'), filename: 'estrela.jpg')
@badge5.save!

@badge6 = Badge.new nome: 'Mestre Supremo', ativo: true, pontos_requeridos: 250
@badge6.imagem.attach(io: File.open('app/assets/images/badges/badge6.png'), filename: 'estrela.jpg')
@badge6.save!

##Artefatos
@artefato1 = Artefato.new nome: 'Magia do Ar', pontos_requeridos: 50, ativo: true, tema_curso_id: 1
@artefato1.imagem.attach(io: File.open('app/assets/images/artefatos/artefato_ar.png'), filename: 'estrela.jpg')
@artefato1.save!

@artefato2 = Artefato.new nome: 'Magia da Terra', pontos_requeridos: 100, ativo: true, tema_curso_id: 1
@artefato2.imagem.attach(io: File.open('app/assets/images/artefatos/artefato_terra.png'), filename: 'estrela.jpg')
@artefato2.save!

@artefato3 = Artefato.new nome: 'Magia da Água', pontos_requeridos: 180, ativo: true, tema_curso_id: 1
@artefato3.imagem.attach(io: File.open('app/assets/images/artefatos/artefato_agua.jpg'), filename: 'estrela.jpg')
@artefato3.save!

@artefato4 = Artefato.new nome: 'Magia do Fogo', pontos_requeridos: 200, ativo: true, tema_curso_id: 1
@artefato4.imagem.attach(io: File.open('app/assets/images/artefatos/artefato_fogo.png'), filename: 'estrela.jpg')
@artefato4.save!

@artefato5 = Artefato.new nome: 'Magia do Éter', pontos_requeridos: 250, ativo: true, tema_curso_id: 1
@artefato5.imagem.attach(io: File.open('app/assets/images/artefatos/artefato_eter.jpg'), filename: 'estrela.jpg')
@artefato5.save!

Usuario.create! nome: 'Professor', cpf: '119.794.737-06', email: 'professor@agile.br', perfil: 'Usuario comum', data_nascimento: '01/02/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678'
Usuario.create! nome: 'Aluno', cpf: '149.656.207-04', email: 'aluno@agile.br', perfil: 'Usuario comum', data_nascimento: '01/03/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678'

#FAQs
Faq.create! pergunta: 'Posso usar um nome diferente do meu (nickname) nos cursos?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Sim. Para iss basta acessar a sua <strong>&quot;Ficha de Atributos&quot; </strong>e clicar no bot&atilde;o <strong>&quot;Editar&quot;</strong>. Na p&aacute;gina de edi&ccedil;&atilde;o aparecer&aacute; seu nome atual no curso. Voc&ecirc; poder&aacute; substitui-lo pelo nickname desejado. &Eacute; poss&iacute;vel utilizar nicknames difrentes em cada curso.</span></p>'
Faq.create! pergunta: 'Qual o critério de desempate utilizado no ranking do AGILE?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Para desempatar participantes com a mesma pontua&ccedil;&atilde;o, o AGILE utiliza como crit&eacute;rio a <strong>data de inscri&ccedil;&atilde;o no curso</strong> (n&atilde;o a data de cadastro no AGILE). Assim, quem se inscreveu primeiro no curso fica na frente.</span></p>'
Faq.create! pergunta: 'Posso criar um chat para conversar com os outros participantes do curso?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Para criar um <strong>chat</strong> &eacute; necess&aacute;rio fazer parte de uma <strong>Equipe</strong>. Ao criar um chat, todos os membros da Equipe de quem o criou poder&atilde;o participar deste. Ou seja, os chats s&atilde;o <strong>separados por Equipe </strong>(Magos, Elfos, Guerreiros, etc.). Os chats criados pelos professores permitem a participa&ccedil;&atilde;o de todos os incritos no curso.</span></p>'
Faq.create! pergunta: 'Posso enviar uma mensagem privada para tirar dúvida com o professor?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Sim. No menu &quot;<strong>Professores</strong>&quot; &eacute; poss&iacute;vel enviar mensagens com as d&uacute;vidas sobre os conte&uacute;dos aos professores do curso. As respostas das mensagens enviadas tamb&eacute;m podem ser visualizadas neste menu e s&atilde;o enviadas tamb&eacute;m por e-mail.</span></p>'
Faq.create! pergunta: 'Como relato um problema ou esclareço alguma dúvida sobre o AGILE?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Em caso de problemas no AGILE ou necessidade de suporte para utiilzar algum recurso voc&ecirc; pode enviar um e-mai para <strong>agile.centro@iff.edu.br</strong>.</span></p>'
Faq.create! pergunta: 'Já escolhi uma Equipe. Posso alterá-la?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">N&atilde;o. Uma vez que existe um <strong>Ranking por Equipe</strong> n&atilde;o &eacute; permitida a altera&ccedil;&atilde;o de Equipe depois da escolha inicial para impedir que os participantes troquem para a Equipe que est&aacute; vencendo.</span></p>'
Faq.create! pergunta: 'Posso alterar meu Avatar?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Voc&ecirc; s&oacute; poder&aacute; escolher um <strong>Avatar</strong> se estiver em uma <strong>Equipe</strong>. O Avatar pode ser alterado a qualquer momento ap&oacute;s a escolha da equipe, de acordo com as op&ccedil;&otilde;es dispon&iacute;veis no AGILE.</span></p>'
Faq.create! pergunta: 'Posso realizar a mesma Missão mais de uma vez?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Existem dois tipos de Miss&otilde;es: <strong>Quiz</strong> e <strong>Tarefa</strong> (envio de arquivo). As perguntas do Quiz <strong>n&atilde;o</strong> podem ser <strong>respondidas novamente</strong>. J&aacute; a Tarefa, caso esteja no prazo e ainda n&atilde;o tenha sido avaliada pelo professor, pode ser alterada.</span></p>'
Faq.create! pergunta: 'Qualquer pessoa pode ser inscrever nos cursos do AGILE?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Na descri&ccedil;&atilde;o dos cursos h&aacute; informa&ccedil;&otilde;es sobre o <strong>p&uacute;blico-alvo</strong> e os <strong>crit&eacute;rios de participa&ccedil;&atilde;o</strong> destes. Fique atento para verificar se voc&ecirc; faz parte do p&uacute;blico-alvo e se atende aos crit&eacute;rios de partipa&ccedil;&atilde;o. Caso n&atilde;o atenda a estes requisitos, voc&ecirc; poder&aacute; n&atilde;o receber o <strong>Certificado</strong>, mesmo que tenha atingido a pontua&ccedil;&atilde;o m&iacute;nima necess&aacute;ria para a aprova&ccedil;&atilde;o no curso.</span></p>'
Faq.create! pergunta: 'Como faço para cancelar minha inscrição em um curso?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Para cancelar sua inscri&ccedil;&atilde;o acesse o curso e clique na p&aacute;gina de &quot;<strong>Detalhes do curso</strong>&quot;. No final da p&aacute;gina estar&aacute; dispon&iacute;vel a op&ccedil;&atilde;o &quot;<strong>Cancelar inscri&ccedil;&atilde;o no Curso</strong>&quot;. S&oacute; &eacute; poss&iacute;vel cancelar a inscri&ccedil;&atilde;o em cursos com status &quot;Em andamento&quot;.</span></p>'
Faq.create! pergunta: 'Como faço para verificar Missões e Pesquisas que ainda faltam ser realizadas?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Para visualizar as Miss&otilde;es e Pesquisas que ainda faltam ser realizadas basta clicar na op&ccedil;&atilde;o &quot;<strong>Pend&ecirc;ncias</strong>&quot; no menu lateral direito. Ad Miss&otilde;es t&ecirc;m datas de in&iacute;cio e t&eacute;rmino definidas, logo fique atento ao per&iacute;odo da Miss&atilde;o. Algumas pesquisas tamb&eacute;m s&oacute; poder&atilde;o ser realizadas no final do curso, ou seja, quando todas as Miss&otilde;es tiverem sido realizadas.</span></p>'
Faq.create! pergunta: 'Basta realizar as todas as Missões para concluir o curso?', resposta: '<p style="text-align: justify;"><span style="color:#000066;">Para concluir o curso voc&ecirc; dever&aacute; clicar no bot&atilde;o &quot;<strong>Finalizar Curso</strong>&quot; na p&aacute;gina principal do curso. Este bot&atilde;o s&oacute; ficar&aacute; dispon&iacute;vel ap&oacute;s todas as pend&ecirc;ncias serem resolvidas. Para verificar se h&aacute; pend&ecirc;ncias, clique na op&ccedil;&atilde;o &quot;Pend&ecirc;ncias&quot; no menu lateral direito do curso.</span></p>'
