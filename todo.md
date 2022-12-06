# Todo

- usar como exemplo https://dueacaso.it/tech/crud_app_with_phoenix/ e https://learn.codiploy.com/simple-and-basic-crud-with-phoenix-elixir-101/ para gerar as páginas.

## Phoenix Generators utilizados

- `mix phx.gen.auth Accounts User users`

- `mix phx.gen.auth Admin_accounts Admin admins`

- `mix phx.gen.html ProductDB Category categories name:string`

- `mix phx.gen.html ProductDB Product products name:string quantity:integer price:float image:string category_id:references:categories`

## Requisitos

### Como um cliente, eu quero

1. Ver produtos (preço por kg, imagem)

2. Ver produtos por categorias (frutas, verduras)

3. Criar uma conta no Supermercado

4. Logar na minha conta

5. Logout da minha conta

6. Adicionar produtos a um pedido

7. Ver o pedido

8. Atualizar o pedido

9. Ver histórico de pedidos

### Como administrador, eu quero

1. Ver clientes.

2. Incluir, alterar e excluir produtos

3. Ver o total de ordens por dia, por mês.
