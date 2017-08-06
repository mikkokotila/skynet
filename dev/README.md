# Dharmanet 

## What do you need? 

- GLi AR-150 [(read more details on the device)](https://wiki.openwrt.org/toh/gl-inet/gl-ar150)
- A USB drive (not bigger than 16gb)
- Some basic computer skills 

## GETTING STARTED

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
    


