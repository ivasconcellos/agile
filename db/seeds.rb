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
@tema_curso = TemaCurso.new nome: 'Padrão', ativo: true, cor_titulo: '#1C2AD2', cor_texto: '#2E40EB', cor_fundo: '#1D50E3'
@tema_curso.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@tema_curso.save!

@grupo = Grupo.new id: 1, nome: 'Mago', ativo: true
@grupo.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@grupo.save!

@avatar_magop = Avatar.new grupo_id: 1, nome: 'Mago negro', perfil: 'Professor', ativo: true
@avatar_magop.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@avatar_magop.save!

@avatar_mago = Avatar.new grupo_id: 1, nome: 'Mago negro', perfil: 'Aluno', ativo: true
@avatar_mago.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@avatar_mago.save!
#Curso.create! nome: 'Curso de Lógica de Programação', descricao: 'Descrição do curso.', data_inicio: '01/01/2019', hora_inicio: '08:00:00', data_termino: '01/01/2020', hora_termino: '23:59:59', codigo_acesso: '12345678', ativo: true, publico: true, tema_curso_id: 1, proprietario_id: 2
#Modulo.create! nome: 'Módulo 1', descricao: "Primeiro módulo do curso", publico: true, curso_id: 1
#Forum.create! titulo: 'Fórum teste', descricao: 'Criação de fórum de teste', curso_id: 1, usuario_curso_id: 1
#SalaChat.create! nome: 'Sala de teste', curso_id: 1, usuario_curso_id: 1, ativo: true
#Missao.create! curso_id: 1, usuario_curso_id: 1, nome: "Primeira missão", descricao: "Faça X coisas.", ativo:true

#Níveis
@nivel0 = Nivel.new id: 1, nome: 'Nível 0', pontos_requeridos: 0
@nivel0.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel0.save!

@nivel1 = Nivel.new id: 2, nome: 'Nível 1', pontos_requeridos: 50
@nivel1.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel1.save!

@nivel2 = Nivel.new id: 3, nome: 'Nível 2', pontos_requeridos: 100
@nivel2.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel2.save!

@nivel3 = Nivel.new id: 4, nome: 'Nível 3', pontos_requeridos: 150
@nivel3.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel3.save!

@nivel4 = Nivel.new id: 5, nome: 'Nível 4', pontos_requeridos: 200
@nivel4.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel4.save!

@nivel5 = Nivel.new id: 6, nome: 'Nível 5', pontos_requeridos: 250
@nivel5.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel5.save!

@nivel6 = Nivel.new id: 7, nome: 'Nível 6', pontos_requeridos: 300
@nivel6.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@nivel6.save!

##Badges
@badge1 = Badge.new nome: 'Badge 1', ativo: true, pontos_requeridos: 0
@badge1.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge1.save!

@badge2 = Badge.new nome: 'Badge 2', ativo: true, pontos_requeridos: 50
@badge2.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge2.save!

@badge3 = Badge.new nome: 'Badge 3', ativo: true, pontos_requeridos: 100
@badge3.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge3.save!

@badge4 = Badge.new nome: 'Badge 4', ativo: true, pontos_requeridos: 150
@badge4.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge4.save!

@badge5 = Badge.new nome: 'Badge 5', ativo: true, pontos_requeridos: 200
@badge5.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge5.save!

@badge6 = Badge.new nome: 'Badge 6', ativo: true, pontos_requeridos: 250
@badge6.imagem.attach(io: File.open('app/assets/images/estrela.jpg'), filename: 'estrela.jpg')
@badge6.save!