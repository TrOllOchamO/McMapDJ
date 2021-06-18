# McMapDJ
A simple terminal app to manage quickly your minecraft maps on your spigot server

### What's the point of using McMapDJ ?

Running your own vanilla minecraft server is cool, but managing it can be tedious sometimes...  
Especialy when it come to change the map multiple times a day.  
Close the server, make a save, upload the new map, (rename some directories), start the server at the right version and manually download the spigot.jar file if the wanted version is missing...  
Already a pain, but it is even more when your friends keep asking you if you are done while you are doing it.  

It wouldn't be nice if it was possible to set or generate a map quikly ? If the server would automaticaly start at the right version ? Or if the spigot.jar would download automaticaly if needed ?

Well it's exactly what McMapDJ doese !

### Some tasks that McMapDJ can do :

[<img src="./Lib/images/initilisation.png" width="600"/>](./Lib/images/menu.png)

#### 1) Change the map
  - replace the current map with one of your saves
























### How do i set it up ?

#### 1) Requirements
You must have : 
1. [Python](https://www.python.org/) with the [Watchdog](https://github.com/gorakhargosh/watchdog) and [discord.py](https://pypi.org/project/discord.py/) libraries and [screen](https://linuxize.com/post/how-to-use-linux-screen/) all installed on your server.
2. A discord bot account, if you dont have one yet go to the [discord developper portal](https://discord.com/developers/docs/intro) and [create one](https://discordpy.readthedocs.io/en/stable/discord.html).

#### 2) Download

Theoretically you can download [McDiscordTerminal](https://github.com/TrOllOchamO/McDiscordTerminal) in any directory on your server and it should work fine, though i only tested it when the file resided directly in my linux user which hosts the server.

#### 3) Initialize

To display the terminal in your discord channel, [McDiscordTerminal](https://github.com/TrOllOchamO/McDiscordTerminal) simply edits an existing message. This means that in order to start displaying stuff, you'll need the bot to send a message first so it can edit it later.

In order to do that, you first need to edit the ``param.txt`` text file, add the token of your bot and the channel id in which you want your minecraft terminal. You can check the [param-example.txt](./param-example.txt).\
Don't forget to [invite your bot](https://discordpy.readthedocs.io/en/stable/discord.html#inviting-your-bot) on your server.

Run ``initialize-terminal.py``. If you followed the steps before, your bot should send a message in your future terminal channel.

[<img src="./Lib/images/initilisation.png" width="600"/>](./Lib/images/initilisation.png)\
Simply copy the id of his message and finish to edit the ``param.txt`` file. You still can check the [param-example.txt](./param-example.txt).

You are done initializing !

#### 4) Use

The only thing left to use your bot is to run your minecraft server using the ``run-server.py`` script and after that run ``McDiscordTerminal.py``.
