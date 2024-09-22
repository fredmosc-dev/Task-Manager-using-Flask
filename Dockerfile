# Use uma imagem base do Python
FROM python:3.8-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências necessárias
RUN pip3 install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o container
COPY . .

# Exponha a porta em que o Flask irá rodar
EXPOSE 5000

# Defina uma variável de ambiente para rodar o Flask em modo de produção
ENV FLASK_APP=run.py
ENV FLASK_ENV=production

# Comando para rodar o aplicativo Flask
CMD ["flask", "run", "--host=0.0.0.0"]
