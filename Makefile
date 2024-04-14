# Variáveis
DC=docker-compose
EXEC=$(DC) exec app

# Comando padrão quando 'make' é executado sem argumentos
default: up

# Inicia os containers do Docker
up:
	$(DC) up -d

# Para os containers do Docker
down:
	$(DC) down

# Lista todos os containers do Docker em execução
ps:
	$(DC) ps

# Executa os testes do PHPUnit
test:
	$(EXEC) vendor/bin/phpunit

# Instala as dependências do Composer
composer-install:
	$(EXEC) composer install

# Atualiza as dependências do Composer
composer-update:
	$(EXEC) composer update

# Gera a chave do aplicativo Laravel
key-generate:
	$(EXEC) php artisan key:generate

# Executa comandos do Artisan (ex: make artisan cmd=migrate)
artisan:
	$(EXEC) php artisan $(cmd)

# Executa comandos do Tinker
tinker:
	$(EXEC) php artisan tinker