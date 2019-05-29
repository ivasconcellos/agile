$(document).ready(function (){
  function add_opcao(e){
    template = $('#template-opcao')
    numero = $(e.target).closest('.wrapper').find('.opcoes').find('.opcao').length + 1
    $($(e.target).closest('.wrapper').find('.opcoes')[0]).append(
      template.html().split('OPCAO_ID').join(numero)
    )
    e.preventDefault(0)
  }
  function rem_opcao(e){
    $(e.target).closest('.wrapper').find('.opcoes').find('.opcao').last().remove()
    e.preventDefault()
  }
 
  $(document).on('click', '.add-opcao-btn', add_opcao)
  $(document).on('click', '.rem-opcao-btn', rem_opcao)
 
})