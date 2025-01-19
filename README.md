# Installatie-instructies voor het project

Volg de onderstaande stappen om het project lokaal te installeren en te draaien:

1. Clone of unzip het project van GitHub. Begin door het project te downloaden via GitHub. Dit kan door het project te klonen of door het als een ZIP-bestand te downloaden en uit te pakken.

    ```bash
    git clone https://github.com/gebruikersnaam/projectnaam.git
    ```

2. Installeer de PHP-afhankelijkheden met Composer:

    ```bash
    composer install
    ```

3. Installeer de NPM-afhankelijkheden met NPM:

    ```bash
    npm install
    ```

4. Genereer de applicatiesleutel met het volgende commando:

    ```bash
    php artisan key:generate
    ```

5. Maak het `.env` bestand aan door het voorbeeldbestand te kopiëren:

    ```bash
    cp .env.example .env
    ```

    Configureer vervolgens de juiste database-instellingen in je `.env` bestand, zoals de host, gebruikersnaam, wachtwoord en database naam:

    ```plaintext
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=je_database_naam
    DB_USERNAME=je_database_gebruiker
    DB_PASSWORD=je_database_wachtwoord
    ```

6. Start DDEV (of je gewenste lokale ontwikkelomgeving) om de applicatie op je lokale machine te draaien. Bijvoorbeeld:

    ```bash
    ddev start
    ```

    Ga vervolgens naar de DDEV container:

    ```bash
    ddev ssh
    ```

7. Voer de database-migraties uit om de benodigde tabellen en structuren in de database aan te maken:

    ```bash
    php artisan migrate
    ```

8. (Optioneel) Seed de database om testgegevens toe te voegen:

    ```bash
    php artisan db:seed
    ```

9. Verlaat de DDEV SSH-sessie voordat je de front-end assets bouwt:

    ```bash
    exit
    ```

10. Build de front-end assets met NPM:

    Voor de productieversie:

    ```bash
    npm run build
    ```

    Of voor de ontwikkelversie (voor live herladen tijdens ontwikkeling):

    ```bash
    npm run dev
    ```

11. Start je applicatie opnieuw om ervoor te zorgen dat alles correct is geladen:

    ```bash
    ddev start
    ```

12. Controleer de website in je browser op de URL die overeenkomt met je lokale server. Bijvoorbeeld:

    ```
    http://niche-community.ddev.site
    ```

---

Met deze stappen zou je je Laravel-project volledig moeten kunnen installeren en uitvoeren op je lokale machine. Als er zich problemen voordoen, controleer dan de logbestanden en zorg ervoor dat alle afhankelijkheden correct zijn geïnstalleerd.
# Spot-Laravel
