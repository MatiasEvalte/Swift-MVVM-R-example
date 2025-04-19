# 🚀 MVVM-R Swift Template

![Swift](https://img.shields.io/badge/Swift-5.0-orange?style=flat-square&logo=swift)
![iOS](https://img.shields.io/badge/iOS-12%2B-lightgrey?style=flat-square&logo=apple)
![MVVM](https://img.shields.io/badge/MVVM-Architecture-informational?style=flat-square)

> Um template leve e funcional utilizando a arquitetura **MVVM-R (Model-View-ViewModel-Router)** em Swift, com foco na organização de responsabilidades e escalabilidade.  
> O projeto simula a injeção de dependência usando **mocks de serviços**, facilitando o entendimento e a aplicação prática da arquitetura.

---

## 🧠 O que é MVVM-R?

A arquitetura **MVVM-R** é uma variação do MVVM que introduz o **Router** para isolar a navegação da lógica da ViewModel. Isso resulta em um código mais limpo, testável e reutilizável.

### 🧱 Camadas

- **Model** – Representação dos dados e regras de negócio.
- **View** – Interface gráfica que exibe os dados.
- **ViewModel** – Intermediária entre Model e View, processa e fornece os dados prontos para exibição.
- **Router** – Gerencia a navegação entre as telas.

---

## 📦 O que esse template inclui?

- Estrutura MVVM-R pronta para uso
- Injeção de dependência via construtor
- Mock de serviço para simular chamadas de rede
- Código comentado para fácil entendimento
