# Dharmanet 

## What do you need? 

- GLi AR-150 [(read more details on the device)](https://wiki.openwrt.org/toh/gl-inet/gl-ar150)
- A USB drive (not bigger than 16gb)
- Some basic computer skills 

## GETTING STARTED

### Before getting started

It's a good idea to have the AR-150 on an internet connection. Either you can plug it to your router (with internet connection) using a LAN cable, or you can connect it through one of the other options provided: 

- repeater (wifi) 
- USB modem
- tethering (not sure how this works) 

Unless you are using a cable connection, you have to login to the admin panel to connect the AR-150 to your internet connection. 

1) go to 192.168.8.1
2) key in the admin password 'goodlife'
3) go to wan settings 

### Upgrade the firmware

Before anything else, it's better to login to the admin panel provided in the factory default firmware, and update it to the latest one. To do this, you have to: 

1) get the latest firmware from [here](http://www.gl-inet.com/firmware/ar150/v1/)
2) power on the AR-150
3) connect to the wireless connection provided by it 
4) go to 192.168.8.1
5) key in the admin password 'goodlife'
6) go to firmware settings and drag the latest version in to the provided box
7) make sure the 'keep settings' options is selected 
8) hit update

If you need to get a detailed information on how to update the firmware, you can get it [here](https://gl-inet.com/docs/mini/firmware/)

### Connecting with SSH 

In order to do what we want to do, you'll need to make an ssh connection to the AR-150. It should be very simple: 

    ssh rooth@192.168.8.1
    
In case you get an error message that ends with: 

    RSA host key for 192.168.8.1 has changed and you have requested strict checking.
    Host key verification failed.

Then remove ~.ssh/known_hosts file. If you think you might lose something important, then take a backup of it first. Note that once you do this, you still might get an error once more, but try it again and it should as you for a password and then you can login. The password is 'goodlife'. 

Once you're in, we will want to do a couple of things. 

##### Check that your USB is mounting ok 

    df 
    
In return you should get a list that ends with something like: 

    /dev/sda1              3904100   1954784   1949316  50% /mnt/sda1
    
You want to make sure that at this point the USB you are using is empty.

##### Creating a symlink between the USB and /www

    cd /www
    USB_PATH=df | grep '/dev/sda1' | tr -s ' ' | cut -d ' ' -f6
    ln -s $USB_PATH .
    
That should leave you with the link between the /www where content is served to the browser, and the USB stick. Now let's create a simple test to make sure that everything works.

    echo "<br><br><h1>Testing USB</h1><a href=\'./sda1/index.html\'>test</a>" > /www/test.html
    echo -e "<br><br><br><h3>Test is passed! </h3>" > /mnt/sda1/index.html
    
Now open your browser and go to 192.168.8.1/test.html and click the 'test' link. In case you get the confirmation, then it means that now we can link from the AR-150 webroot to the USB. Which is very cool as we don't have to change any system configuration files.

Before leaving the system, let's find out what is the USB path (it should be /mnt/sda1/) just in case, and make a note of it as you'll need to have it in the next step. 

##### Getting your content on the USB

The best way to get your content on the USB is to use secure copy from shell: 

    scp ~/local/user/my_website_files root@192.168.8.1:/mnt/sda1
    
That's all there is to it for now. You can access the content in http://192.168.8.1/sda1/. Do note that AR-150 firmware does not automatically look for index.html from the subfolders such as the one we are using now, so you have to request the actual filename. Later we will streamline this process so that everything loads automatically from our own custom domain name. 

We're going through these extra hoops now for two reasons: 

1) we want to keep access to AR-150 factory admin panel (which also gives us access to openwrt admin panel) 
2) we want to stay as close to possible to the factory setting (as in to avoid issues with firmware updates etc) 
