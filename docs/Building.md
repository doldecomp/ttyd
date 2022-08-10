
# Building

*How to setup & build this project.*

<br>

## Requirements

-   **[DevKitPro]**

-   **[Python3]**

    ```sh
    pacman -S msys/python3
    ```

-   **[GCC]**

    ```sh
    pacman -S gcc
    ```

<br>
<br>

## Instructions

<br>

1.  Download the **Gamecube SDK**.

    <br>

2.  Create an **Environment Variable** called  <br>
    `SDK_BASE_PATH` pointing to its root folder.

    *The root folder should contain* <br>
    *the `HW2` & `include` folders.*

    <br>

3.  Install **Codewarrior** for the Gamecube.

    *Preferrably use `v2.7` as it can be found in full.*

    <br>

4.  Create an **Environment Variable** called <br>
    `CW_BASE_PATH` pointing to the installation folder.

    <br>

5.  Obtain a clean **DOL** of `The Thousand Year Door JP` .

    <br>

6.  Place it in the root folder with `baserom.dol` as its name.

    <br>

7.  Download <kbd>**[GC_WII_COMPILERS.zip][GC]**</kbd>

    <br>

8.  Extract it's content to `/tools/mwcc_compiler/` 

    <br>

9.  Run the **Make** command :

    ```sh
    make
    ```

<br>


<!----------------------------------------------------------------------------->

[DevKitPro]: https://devkitpro.org/wiki/Getting_Started
[Python3]: https://www.python.org/
[GCC]: https://gcc.gnu.org/
[GC]: https://cdn.discordapp.com/attachments/727918646525165659/917185027656286218/GC_WII_COMPILERS.zip