# Real World Hacking in the TV Show [Mr. Robot](https://www.imdb.com/title/tt4158110/?ref_=nv_sr_1?ref_=nv_sr_1)

## Reconnaissance

![Reconnaissance](./site/images/mr_robot_volatility.png)

In this screenshot from **Mr. Robot**, Elliot runs [`volatility`](https://www.volatilityfoundation.org/) (a forensics tool used to dump and analyze a system's memory).
The commands he's executing find the address in memory of a `dynamically linked library`,
which is external code that a program loads when it runs to add functionality. 
For example, the program might load a `DLL` that detects hardware such as disks,
keyboard, mouse, network, or a graphics card. In this case, the _`dll`_ seems to be
`libhd.so`.

He finds that libary's address in memory so that he can manipulate its
view of the world or to read the data it has saved. This method enables him to spy
on anything the victim types on their keyboard, for example.

## Weaponization

![Weaponization](./site/images/mr_robot_shellcode.png)

In this screenshot from **Mr. Robot**, Elliot is injecting [**`shellcode`**](https://en.m.wikipedia.org/wiki/Shellcode) ([`hexadecimal`](https://en.m.wikipedia.org/wiki/Hexadecimal) - a base16
numbering system - encoded computer instructions) that will be used to **exploit a PDF vulnerability.**
The PDF is later to a victim who is compromised after they open the file.

## Exfiltration

![Exfiltration](./site/images/mr_robot_keylogger.png)

In this screenshot from **Mr. Robot**, Elliot is reading the **keylogger** data he has stored on the victim's
machine in a file called _`/dev/nu11`_. This name is a smart method against Linux victim,
[**`/dev/null`**](https://en.m.wikipedia.org/wiki/Null_device) is a **"blackhole"** -
data to ignore can redirect here to avoid printing it to the screen or storing it in a file.

The most common use case for writing to **`/dev/null`** is the data output from a command,
script, or application that isn't needed. Elliot is trying to evade notice by writing to
_`/dev/nu11`_ because someone looking for a malicious process may mistakenly believe the
process is writing to **`/dev/null`** and not attempt to look because assume it doesn't contain data.
He periodically saves data to this file so that he has a history of everything the user types.
