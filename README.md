# skynet 

Things needed for this setup: 

- GLi-ar150 router
- Memory device (sd, usb, etc.)

You'll also need to have a computer to access the router througout the setup with ssh and browser. 

In terms of the memory device you can use USB stick or sd card with adapter. I think if you provide power externally, you can also use external hard-drive. I have not experimented with this, but Terry from VillageTelco should know. Close to 100% of all this is his ideas / code. 

## Setting Up the CMS on the memory device

1) Download the skynet-cms-2.zip file, everything is included in there 

2) expand the contents of the file to the folder you want have index.html in 

3) replace taxonomy.cms found in the /taxonomy folder with your own taxonomy

NOTE: Alternatively you can create a new one using cms-input.sh

4) Execute run.sh

## taxonomy reference

The taxonomy reference is used to create the category/language pages. 

- the taxonomy is in tab separated format 
- each row represents an item in the language pages 
- more than one language can be added for each item 
- columns 7 and higher are reserved for languages 

Logo-url  Source-url  Name  Kind  Format  Description Language1 Language2 Language3

NOTE: all are tab separated. Minimum is 7 columns, but in case of more than one language for the item, more than 7 columns are allowed. 

## Setting Up Content

## Setting Up the Router

This will take about 5 minutes, which is mostly waiting. First you have to get the right firmware: 

http://download.villagetelco.org/firmware/secn/unstable/ar150/SECN-5-VT-RACHEL/Alpha3/openwrt-SECN-5.0-AR150-RACHEL-Alpha3-AR150-ar150-squashfs-sysupgrade.bin

Once you have it, check the checksum: 

md5sum: http://download.villagetelco.org/firmware/secn/unstable/ar150/SECN-5-VT-RACHEL/Alpha3/md5sums-SECN-5.0-AR150-RACHEL-Alpha3.txt

After that you can connect to the GLi-ar150 through http://192.168.8.1 and login with the details written on the bottom of the casing. It asks you to change the password, but we're not worried about that because the firmware upgrade is going to change that anyways. 

Once you've succesfully upgraded the firmware, you should see a wireless network you can connect to 'VT-RACHEL'. Once connected to the network, you can access HOME, ADMIN and SECN in your browser. 

http://vtrachel = HOME
http://vtrachel/admin = ADMIN
http://vtrachel/secn = SECN

While ADMIN is for regular configuration, you have to use SECN for full configuration. Note that the mode has to be set to "SECN Advanced" on the admin screen for changes to be effective in SECN screens. 

NOTE ON SSH: If you want to make changes with ssh, you have to first set SECN-Advanced, as otherwise your changes will get over-written on restart of the router. 

#### Turning on SECN-Advanced

The mode setting in on the VT-RACHEL admin page at http://vtrachel/admin. This setting is used to run the device with Ethernet WAN or Mesh WAN, or to put it into SECN-Advanced mode where you can make whatever changes you like.

Note also that the LAN port is restricted by default. Only the Fallback IP address is operational by default.
This has been done to prevent network issues caused by users plugging the upstream school network into the LAN port instead of the WAN port and causing DHCP server conflicts.

#### How to connect with ssh? 

Note that before connecting with ssh, you have to have turn on SECN-Advanced (see instructions above). Then connect with:

    ssh root@10.130.1.254

For reference, there is a page on the VT Wiki describing the VT-Rachel firmware here:

       http://wiki.villagetelco.org/RACHEL_on_MP2


#### What users are created for the firmware? 

root:vtrachel # The "root" account will also give you ssh access.
admin:rachel  # The "admin" account allows you to make changes using the GUI only. 

##### /www/index.html

This is the initial splash page.

##### /www/rachel/rachel.index.html

This is the Home page. You need to name it to match the link above.The content of this file points to the various module directories, so you can just edit it to remove the ones you don't want and to add new ones.

##### /etc/init.d/set-rachel.sh

This is the initialization script where the memory device is mapped in to the system and the location of the public directory is set. 

##### setting up default home page from command line 

ln -s -f /www/rachel/rachel.index.html   /www/rachel/index.html


### How to reset GLi-ar150

Sometimes you might run in to a situation where the router stops responding entirely and you can no longer connect to it through wireless. If this happens, try connecting through cable and if that fails then proceed to resetting the router. 

The other scenario where you might have to revert back to original firmware, is when you've already upgraded to a custom firmware that does not support switching to other firmware. 

1) Connect an cable from your PC to the LAN port on your AR150 router.

2) Press and hold the Reset button firmly, then power on your device.

3) The LEDs will start to blink. Count the blinks.

4) Release the Reset button after the LED has flashed 5 times. 

5) Uboot will enter Web UI mode automatically. 

6) Set your computer’s IP address to static 192.168.1.2

7) Point your browser to  http://192.168.1.1 to get the web page (as attached)

8) Browse for your firmware and upload.

9) Wait around 3 minutes. Don’t power down your device while upgrading.
