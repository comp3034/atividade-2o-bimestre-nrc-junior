Funcionalidade: Gerenciar minhas medidas
Eu como usuário
Quero ter acesso as minhas últimas medidas e adicionar novas medidas

Cenário: Visualizar as últimas medidas inseridas
Dado que eu abri o aplicativo
Quando eu clicar no menu/botão "Medidas"
E for encaminhado para outra página
Então as últimas medidas adicionadas serão mostradas

Cenário: Adicionar novas medidas
Dado que eu estou na página de visualizar as últimas medidas
Quando eu clicar no botão de "+"
E for direcionado para a página de adição
E clicar nas medidas 
E adicionar os novos valores
E clicar em atualizar
Então serei redirecionado para a página de visualizar últimas medidas

Cenário: Adicionar novas medidas sem conexão com o backend
Dado que eu estou na página de visualizar as últimas medidas
Quando eu clicar no botão de "+"
E for direcionado para a página de adição
E clicar nas medidas 
E adicionar os novos valores
E clicar em atualizar
Então aparecerá uma mensagem de erro 
