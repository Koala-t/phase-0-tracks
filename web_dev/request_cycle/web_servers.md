# Web Servers

## Question 1:
## What are some of the key design philosophies of the Linux operating system?

* The core of the design philosophy for linus is to develop free and open-source software.
* linux uses a modular design with a core 'kernel' which can be added to.
* from a list of the 9 major tenets of the linux philosophy (source: https://opensource.com/business/15/2/how-linux-philosophy-affects-you)
1. Small is beautiful.
2. Each program does one thing well.
3. Prototype as soon as possible.
4. Choose portability over efficiency.
5. Store data in flat text files.
6. Use software leverage.
7. Use shell scripts to increase leverage and portability.
8. Avoid captive user interfaces.
9. Make every program a filter.

## Question 2:
## In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

* A Virtual Private Server is a remote computer You can access and use.
* Because servers are just computers or some memory impersonating a computer you can use a VPS to develop a server without worrying about any attacks ruining your personal computer while you are still developing the server. 
* You also don't have to worry about accidentally deleting all the files on your computer because you are working on the virtual machine.

## Question 3:
## Why is it considered a bad idea to run programs as the root user on a Linux system?

* It is inadvisable to work as the root user on a linux system because the root user has universal access. They can go anywhere and do anything. This opens up the possibility for you to run a command which would damage the system on accident. More importantly, It would allow someone else who has broken into your server to wreak some serious havoc. They can change permission settings, steal any and all information stored on the server and do anything else they want to.