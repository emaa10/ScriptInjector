# ScriptInjector
Inject and run scripts on remote computers and get the output back via scp or a discord webhook
For educational purposes only.

## How it works
1. Clone this repo and cd into it
2. Install packages
    ```
    sudo apt install apache2 openssh-client screen
    sudo systemctl enable ssh
    ```
3. Setup an apache2 webserver and put the files under `/src` into `/var/www/html/`
    ```
    sudo mv src /var/www/html
    ```
4. Generate an ssh-key to allow your victim to scp into your system
    It is recommended to use another user with fewer permissions 
    ```
    ssh-keygen -t rsa
    ```
    Press enter on all questions.
    ```
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    mv ~/.ssh/id_rsa ~/.ssh/id_rsa.pub .
    ```

- SSH KEYS und config, config auch anpassen an IP
- HTML.sh mit screen und serveo
- run download.bat mit exe oder rubber ducky
alles noch in vm testen