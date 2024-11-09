# Smartooth-AI-Docker

- Projeto: Smartooth AI - Challenge ODONTOPREV 2TDSZ-2024
  
- Integrantes ByteBloom Tech
  - RM554113 - Juliana Moreira da Silva - Desenvolvimento ML e DevOps
  - RM552590 - Kevin Christian Nobre - Desenvolvedor Full Stack .NET e Mobile
  - RM552728 - Sabrina do Couto Xavier Lima - Desenvolvedora Full Stack Java e Mobile

  
- **Descrição:**
  - O projeto Smartooth AI é uma solução inteligente para o setor odontológico, projetada para fornecer recomendações e monitoramento personalizados. Utilizamos Docker e Docker Compose para realizar o deployment dos componentes em uma arquitetura de nuvem híbrida, utilizadando recursos de PaaS. Nessa primeira etapa do deploy na cloud, obtivemos sucesso criando um contâiner Docker para a nossa API em Spring Java, mas nas próximas sprints pretendemos unificar mais partes do nosso sistema na nossa cloud com Docker e Kubernetes, otimizando nossa esteira de produção de forma segura, com baixa latência e eficiencia para um sistema que atenderá milhares de pessoas como o Smartooth AI. Mais detalhes da nossa solução estarão disponíveis no PDF da Sprint 2. O projeto está disponível na branch *Master*.

- **Requisitos**
  - Docker
  - Docker Compose
  - Git

- **Passos para Deploy**

- Clonar o repositório:

``` bash
git clone https://github.com/seu-usuario/smartooth-ai.git
cd smartooth-ai
```

- **Configurar diretórios e permissões:**

  - Definimos o /app/smartooth como o diretório de trabalho padrão.
Executamos a aplicação como um usuário não administrativo.

- **Executar o Docker Compose:**

No diretório do projeto, execute:
``` bash
docker-compose up -d
```

- Esta configuração faz o deployment dos containers em background.

- ## **Estrutura do Projeto**
  - **/app:** Diretório com os arquivos principais do Smartooth AI.
  - **docker-compose.yml:** Define e orquestra os containers.
  - **Dockerfile:** Configura a imagem para o back-end, que utiliza Java e uma imagem slim baseada em Alpine.
README.md: Instruções de deploy e detalhes do projeto.

- **Testes**
  - Após o deployment, acesse http://localhost:8080 para verificar o back-end.
Use a aplicação mobile para se conectar ao backend e testar as funcionalidades.
