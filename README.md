## skynet-cms

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
