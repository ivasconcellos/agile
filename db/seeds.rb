# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create! nome: 'admin', email: 'suporte.ti.centro@iff.edu.br', password: '12345678'
Usuario.create! nome: 'Gestor', email: 'gestor@iff.edu.br', perfil: 'Gestor', data_nascimento: '01/01/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678', cpf: '133.230.797-36'
Usuario.create! nome: 'Professor', email: 'professor@iff.edu.br', perfil: 'Usuario comum', data_nascimento: '01/02/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678', cpf: '119.794.737-06'
Usuario.create! nome: 'Aluno', email: 'aluno@iff.edu.br', perfil: 'Usuario comum', data_nascimento: '01/03/2000', sexo: 'Masculino', ativo: true, termo_compromisso: true, password: '12345678', cpf: '149.656.207-04'

#Curso.create! nome: 'Curso de Lógica de Programação', descricao: 'Descrição do curso.', data_inicio: '01/01/2019', hora_inicio: '08:00:00', data_termino: '01/01/2020', hora_termino: '23:59:59', codigo_acesso: '12345678', ativo: true, publico: true, tema_curso_id: 1, proprietario_id: 2
#Modulo.create! nome: 'Módulo 1', descricao: "Primeiro módulo do curso", publico: true, curso_id: 1
#Forum.create! titulo: 'Fórum teste', descricao: 'Criação de fórum de teste', curso_id: 1, usuario_curso_id: 1
#SalaChat.create! nome: 'Sala de teste', curso_id: 1, usuario_curso_id: 1, ativo: true
#Missao.create! curso_id: 1, usuario_curso_id: 1, nome: "Primeira missão", descricao: "Faça X coisas.", ativo:true


@tema_curso = TemaCurso.new nome: 'Padrão', ativo: true, cor_titulo: '#1C2AD2', cor_texto: '#2E40EB', cor_fundo: '#1D50E3'
@tema_curso.imagem.attach(io: File.open('app/assets/images/backgrounds/background_mystic.jpg'), filename: 'estrela.jpg')
@tema_curso.save!

#Grupos
@grupo1 = Grupo.new id: 1, nome: 'Magos', ativo: true, perfil: 'Aluno'
@grupo1.imagem.attach(io: File.open('app/assets/images/grupos/grupo_mago.jpg'), filename: 'estrela.jpg')
@grupo1.save!

@grupo2 = Grupo.new id: 2, nome: 'Elfos', ativo: true, perfil: 'Aluno'
@grupo2.imagem.attach(io: File.open('app/assets/images/grupos/grupo_elfo.jpg'), filename: 'estrela.jpg')
@grupo2.save!

@grupo3 = Grupo.new id: 3, nome: 'Guerreiros', ativo: true, perfil: 'Aluno'
@grupo3.imagem.attach(io: File.open('app/assets/images/grupos/grupo_guerreiro.jpg'), filename: 'estrela.jpg')
@grupo3.save!

@grupo4 = Grupo.new id: 4, nome: 'Oráculos', ativo: true, perfil: 'Professor'
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

@avatar_guerreiro3 = Avatar.new grupo_id: 3, nome: 'Guerreirao', perfil: 'Aluno', ativo: true
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
@nivel1 = Nivel.new id: 1, nome: 'Nível 1', pontos_requeridos: 0
@nivel1.imagem.attach(io: File.open('app/assets/images/niveis/nivel1.png'), filename: 'estrela.jpg')
@nivel1.save!

@nivel2 = Nivel.new id: 2, nome: 'Nível 2', pontos_requeridos: 50
@nivel2.imagem.attach(io: File.open('app/assets/images/niveis/nivel2.png'), filename: 'estrela.jpg')
@nivel2.save!

@nivel3 = Nivel.new id: 3, nome: 'Nível 3', pontos_requeridos: 100
@nivel3.imagem.attach(io: File.open('app/assets/images/niveis/nivel3.png'), filename: 'estrela.jpg')
@nivel3.save!

@nivel4 = Nivel.new id: 4, nome: 'Nível 4', pontos_requeridos: 150
@nivel4.imagem.attach(io: File.open('app/assets/images/niveis/nivel4.png'), filename: 'estrela.jpg')
@nivel4.save!

@nivel5 = Nivel.new id: 5, nome: 'Nível 5', pontos_requeridos: 200
@nivel5.imagem.attach(io: File.open('app/assets/images/niveis/nivel5.png'), filename: 'estrela.jpg')
@nivel5.save!

@nivel6 = Nivel.new id: 6, nome: 'Nível 6', pontos_requeridos: 250
@nivel6.imagem.attach(io: File.open('app/assets/images/niveis/nivel6.png'), filename: 'estrela.jpg')
@nivel6.save!

##Badges
@badge1 = Badge.new nome: 'Aprendiz', ativo: true, pontos_requeridos: 0
@badge1.imagem.attach(io: File.open('app/assets/images/badges/badge1.png'), filename: 'estrela.jpg')
@badge1.save!

@badge2 = Badge.new nome: 'Aspirante', ativo: true, pontos_requeridos: 50
@badge2.imagem.attach(io: File.open('app/assets/images/badges/badge2.png'), filename: 'estrela.jpg')
@badge2.save!

@badge3 = Badge.new nome: 'Especialista', ativo: true, pontos_requeridos: 100
@badge3.imagem.attach(io: File.open('app/assets/images/badges/badge3.png'), filename: 'estrela.jpg')
@badge3.save!

@badge4 = Badge.new nome: 'Perito', ativo: true, pontos_requeridos: 150
@badge4.imagem.attach(io: File.open('app/assets/images/badges/badge4.png'), filename: 'estrela.jpg')
@badge4.save!

@badge5 = Badge.new nome: 'Mestre', ativo: true, pontos_requeridos: 200
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