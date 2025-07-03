# 🐧 Projeto DevSecOps 2025

---

## 📖 Descrição
Projeto de configuração de **servidor web** com **Nginx** e **monitoramento** via **Telegram**, implementado na **AWS EC2**.


---

## 🚀 Tecnologias
- **Sistema Operacional:** Ubuntu 24.04 LTS  
- **Servidor Web:** Nginx  
- **Script de Monitoramento:** Bash + `curl`  
- **Alertas:** Telegram Bot API  
- **Provisionamento na Nuvem:** AWS EC2  

---
## ☁️ Como criar sua instância EC2 na AWS

1. Faça login no **AWS Management Console** e vá para **EC2**.  
2. No menu lateral, clique em **“Instances”** > **“Launch instances”**.  

3. **Configure os detalhes da instância**:  
  ![image](https://github.com/user-attachments/assets/db33730f-86a7-44e3-ad7e-aa944c19fe41)

 Adicione as tags necessárias para o seu projeto.

 

4. **Configure rede** 
![image](https://github.com/user-attachments/assets/9cbf5993-8c56-4d77-9d7c-8b0989c49b09)

5. **Criar o par de chaves**

![image](https://github.com/user-attachments/assets/100c66a4-28bd-4d57-ba44-84778de65071)

Clique em "Criar novo par de chaves"

![image](https://github.com/user-attachments/assets/2570ba22-c1da-4b83-a8e4-8b19bfa429e6)

Após nomeá-la e escolher seu tipo e formato, clique em "Criar par de chaves"
O arquivo será baixado imediatamente no seu PC.

6. **Configurar sua chave SSH no local**  

```bash
mkdir -p ~/.ssh
mv ~/Downloads/teste-devsecops-key.pem ~/.ssh/
chmod 400 ~/.ssh/teste-devsecops-key.pem
```

7. **Armazenamento**:  
  ![image](https://github.com/user-attachments/assets/6d55149e-6483-4d58-a2f3-81f3a4c9d6d2)

 8. **Criar Instância**

Aqui possui toda a informação da sua instância, apenas clique em "Executar Instância"

![image](https://github.com/user-attachments/assets/ef8f9830-319b-475b-a45b-1f62bd075eb5)


9. **Acesse sua instância** com SSH:  
    ```bash
    ssh -i ~/.ssh/teste-devsecops-key.pem ubuntu@<IP_PÚBLICO_DA_INSTÂNCIA>
    ```

---
## 💻 Instalação Local (VM Ubuntu)

1. **Atualizar sistema:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
   
2. **Instalar Nginx:**

```bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
```

Verifica se está ativo:

```bash
sudo systemctl status nginx
```

Deve aparecer que está "Running". Após isso, pressione a tecla "Q" para sair do menu.

3. **Criar página HTML:**

```bash
sudo nano /var/www/html/index.html
```

Crie, ou cole, o conteúdo e salve.
crtl + O
Enter
crtl + X


4. **Criar script de monitoramento:**

```bash
sudo nano /usr/local/bin/monitoramento.sh
```

Insira seu TOKEN e CHAT_ID.

5. **Torne executável:**

```bash
sudo chmod +x /usr/local/bin/monitoramento.sh
```

6. **Criar o log:**

```bash
sudo touch /var/log/monitoramento.log
sudo chmod 666 /var/log/monitoramento.log
```

7. **Agendar no Cron:**

```bash
sudo crontab -e
```

8. **Adicione:**

Só precisa adicioná-lo no fim do código mostrado na sua tela.

```bash
* * * * * /usr/local/bin/monitoramento.sh
```
       
---


**🤖 Bot Telegram**

Converse com o @BotFather para criar seu bot.

Obtenha o TOKEN.

Inicie conversa com o bot e acesse:

```bash
https://api.telegram.org/bot<TOKEN>/getUpdates
```
![image](https://github.com/user-attachments/assets/7a41ce6c-561e-4820-8e3f-e9f893f43ebd)

Copie o chat_id.

---

**🧪 Testes**

```bash
Verificar página: http://localhost ou http://<IP_PÚBLICO>
```
![image](https://github.com/user-attachments/assets/c9170a75-4777-4f76-943d-85a4a2d4270b)


*Simular falha:*

```bash
sudo systemctl stop nginx
```

Aguarde 1 minuto e confira o alerta no Telegram.

## 📄 Documentação
- Este README  
- Comandos executados  
- Prints 
