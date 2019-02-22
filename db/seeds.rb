# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create! nome: 'admin', email: 'admin@iff.edu.br', password: '12345678'
Usuario.create! nome: 'Gestor', email: 'gestor@iff.edu.br', perfil: 'Gestor', data_nascimento: '01/01/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678'
Usuario.create! nome: 'Professor', email: 'professor@iff.edu.br', perfil: 'Usuario comum', data_nascimento: '01/02/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678'
Usuario.create! nome: 'Aluno', email: 'aluno@iff.edu.br', perfil: 'Usuario comum', data_nascimento: '01/03/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678'
Curso.create! nome: 'Curso de Lógica de Programação', descricao: 'Descrição do curso.', data_inicio: '01/01/2019', data_termino: '01/01/2020', codigo_acesso: '12345678', ativo: true, publico: true, tema_curso_id: 1, proprietario_id: 2
#Modulo.create! nome: 'Módulo 1', descricao: "Primeiro módulo do curso", publico: true, curso_id: 1
#Forum.create! titulo: 'Fórum teste', descricao: 'Criação de fórum de teste', curso_id: 1, usuario_curso_id: 1
#SalaChat.create! nome: 'Sala de teste', curso_id: 1, usuario_curso_id: 1, ativo: true
#Missao.create! curso_id: 1, usuario_curso_id: 1, nome: "Primeira missão", descricao: "Faça X coisas.", ativo:true
#Níveis
#@nivel1 = Nivel.create! nome: 'Nível 1', pontos_requeridos: 50
#@nivel1.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@nivel2 = Nivel.create! nome: 'Nível 2', pontos_requeridos: 100
#@nivel2.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@nivel3 = Nivel.create! nome: 'Nível 3', pontos_requeridos: 150
#@nivel3.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@nivel4 = Nivel.create! nome: 'Nível 4', pontos_requeridos: 200
#@nivel4.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@nivel5 = Nivel.create! nome: 'Nível 5', pontos_requeridos: 250
#@nivel5.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@nivel6 = Nivel.create! nome: 'Nível 6', pontos_requeridos: 300
#@nivel6.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')


##Badges
#@badge1 = Badge.create! nome: 'Badge 1', ativo: true
#@badge1.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@badge2 = Badge.create! nome: 'Badge 2', ativo: true
#@badge2.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@badge3 = Badge.create! nome: 'Badge 3', ativo: true
#@badge3.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@badge4 = Badge.create! nome: 'Badge 4', ativo: true
#@badge4.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@badge5 = Badge.create! nome: 'Badge 5', ativo: true
#@badge5.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')

#@badge6 = Badge.create! nome: 'Badge 6', ativo: true
#@badge6.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')