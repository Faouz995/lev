# Étape 1 : Utiliser l'image de base avec Node.js
FROM node:14

# Étape 2 : Installer les paquets nécessaires
RUN apt-get update && apt-get install -y \
    git \
    curl

# Étape 3 : Cloner le dépôt Git de ton application
RUN git clone https://github.com/Faouz995/whatsapp-bot-md /app/botName

# Étape 4 : Définir le répertoire de travail
WORKDIR /app/botName

# Étape 5 : Installer les dépendances avec Yarn
RUN yarn install --network-concurrency 1



# Étape 7 : Exposer le port de ton application (le cas échéant)
# EXPOSE 3000

# Étape 8 : Spécifier la commande à exécuter lorsque le conteneur démarre
CMD ["yarn", "start"]

# Exemple de commande pour exécuter le conteneur en local :
# docker build -t whatsapp-bot .
# docker run -d --name whatsapp-bot-container -p 3000:3000 whatsapp-bot
