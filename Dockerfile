# Étape 1 : Utiliser l'image de base avec Node.js
FROM node:14

# Étape 2 : Installer les paquets nécessaires
RUN apt-get update && apt-get install -y \
    git \
    curl

# Étape 3 : Cloner le dépôt Git de ton application
RUN git clone https://github.com/lyfe00011/whatsapp-bot-md /app/botName

# Étape 4 : Définir le répertoire de travail
WORKDIR /app/botName

# Étape 5 : Installer les dépendances avec Yarn
RUN yarn install --network-concurrency 1

# Étape 6 : Copier le fichier de configuration
RUN echo "
PREFIX=.
STICKER_PACKNAME=LyFE
ALWAYS_ONLINE=false
RMBG_KEY=null
LANGUAG=en
WARN_LIMIT=3
FORCE_LOGOUT=false
BRAINSHOP=159501,6pq8dPiYt7PdqHz3
MAX_UPLOAD=200
REJECT_CALL=false
SUDO=989876543210
TZ=Asia/Kolkata
VPS=true
AUTO_STATUS_VIEW=true
SEND_READ=true
AJOIN=true" > config.env

# Étape 7 : Exposer le port de ton application (le cas échéant)
# EXPOSE 3000

# Étape 8 : Spécifier la commande à exécuter lorsque le conteneur démarre
CMD ["yarn", "start"]

# Exemple de commande pour exécuter le conteneur en local :
# docker build -t whatsapp-bot .
# docker run -d --name whatsapp-bot-container -p 3000:3000 whatsapp-bot
