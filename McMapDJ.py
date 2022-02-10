import os
import re
import time
import shutil
import urllib.request
from subprocess import check_output


# ---------------------------------------------------Various tools-----------------------------------------------------#


def text2dic(file_path, separator='=', dic=None):
    """
    convert line by line the content of the text file into a dictionnary,
    every line of the file read corresponds to a key and a value,
    the key equal to the part before the separator given in parameter and
    its value corresponds to the part after the separator
    """
    if dic is None:
        dic = {}
    try:
        with open(file_path, 'r') as file:
            for line in file:
                if separator in line:
                    key = line[:line.find(separator)]
                    value = line[line.find(separator) + 1:].rstrip('\n')
                    dic[key] = value
    except:
        printr("txt2dico has met a problem verifying if your path is correct")
    return dic


def replace_in_file(file_path, regexEx, replaced_with=''):
    """
    if the line of the file match with the regex expression,
    replace the line with the content of the argument 'replaced_with'
    """
    with open(file_path, 'r') as f:
        lines = f.readlines()
    for i in range(len(lines)):
        if re.search(regexEx, lines[i]):
            lines[i] = f"{replaced_with}\n"
    with open(file_path, 'w') as f:
        for line in lines:
            f.write(line)


def my_copy_tree(src, dst, dump=True):
    """
    copy the content of a src directory to the dst directory
    if dump argument set to false,
    create a directory in dst and copy the src content inside it
    """

    def copy_a_tree(src, dst):
        dir = os.listdir(src)
        list_files = []
        for thing in dir:
            if os.path.isdir(f"{src}/{thing}"):
                os.makedirs(f"{dst}/{thing}")
                copy_a_tree(src=f"{src}/{thing}", dst=f"{dst}/{thing}")
            else:
                list_files.append(thing)
        for file in list_files:
            shutil.copy2(src=f"{src}/{file}", dst=dst)

    if dump:
        copy_a_tree(src, dst)
    else:
        try:
            name = src[src.rfind('/') + 1:]
        except:
            name = src[src.rfind('\\') + 1:]
        os.makedirs(f"{dst}/{name}")
        dst = f"{dst}/{name}"
        copy_a_tree(src, dst)


def sure(confirmationMessage):
    printy(confirmationMessage)
    printw("If you want to continue type y, else type n")
    choice = input().lower()

    while not (choice == 'y' or choice == 'n'):
        printr("[ERROR] Invalid input")
        printy(confirmationMessage)
        printw("If you want to continue type y, else type n")
        choice = input().lower()

    if choice == 'y':
        is_ok = True
    else:
        is_ok = False

    return is_ok


def display_indexed_in_columns(input_list, nb_of_columns, delimitation):
    columns, rows = os.get_terminal_size()

    if len(input_list) % nb_of_columns == 0:
        nb_rows = int(len(input_list) / nb_of_columns)
    else:
        nb_rows = int(len(input_list) / nb_of_columns) + 1

    columns_width = int((columns - (nb_of_columns - 1)) / nb_of_columns)
    len_space_and_parenthesis = 2
    len_tree_dots = 3

    menu = []
    for i in range(nb_rows):
        menu.append("")

    for i in range(nb_of_columns):
        for n in range(nb_rows):
            index = i * nb_rows + n
            if index < len(input_list):
                if i < nb_of_columns - 1:
                    nb_of_space = columns_width - len(str(index)) - len_space_and_parenthesis - len(input_list[index])
                else:
                    nb_of_space = (columns - len(menu[n]) - len(str(index)) - len_space_and_parenthesis - len(input_list[index]))
                    delimitation = ''
                if nb_of_space < 0:
                    menu[n] = f"{menu[n]}{index}) {input_list[index][:nb_of_space -len_tree_dots]}...{delimitation}"
                else:
                    menu[n] = f"{menu[n]}{index}) {input_list[index]}{' ' * nb_of_space}{delimitation}"
            else:
                nb_of_space = columns - len(menu[n])
                menu[n] = f"{menu[n]}{' ' * nb_of_space}"
    print(''.join(menu))


def choose_index(list, message):
    printw(message)
    choosen_index = input()

    # making sure the input is an integer and in the right interval
    while True:
        try:
            choosen_index = int(choosen_index)
            if len(list) > choosen_index >= 0:
                break
            else:
                printr(f"[ERROR] You must enter an integer in the interval [0;{len(list) - 1}]")
                printw(message)
                choosen_index = input()

        except:
            printr(f"[ERROR] You must enter an integer in the interval [0;{len(list) - 1}]")
            printw(message)
            choosen_index = input()

    return choosen_index


def input_integer(message, allow_negative=False, minimum=None):
    while True:
        printw(message)
        choice = input()
        try:
            choice = int(choice)
            if minimum is not None:
                if choice >= minimum:
                    if not allow_negative:
                        if choice >= 0:
                            break
                        else:
                            invalid_input = 10 / 0
                    else:
                        break
                else:
                    invalid_input = 10 / 0
            else:
                if not allow_negative:
                    if choice >= 0:
                        break
                    else:
                        invalid_input = 10 / 0
                else:
                    break
        except:
            if minimum is not None:
                if not allow_negative:
                    if minimum >= 0:
                        printr(f"[ERROR] you must enter an integer in the interval [{minimum};+infinity]")
                    else:
                        printr("[ERROR] you must enter an integer in the interval [0;+infinity]")
                else:
                    printr(f"[ERROR] you must enter an integer in the interval[{minimum};+infinity]")
            else:
                if not allow_negative:
                    printr("[ERROR] you must enter an integer in the interval [0;+infinity]")
                else:
                    printr("[ERROR] you must enter an integer")

            if allow_negative:
                printr("[ERROR] you must enter an integer")
            else:
                printr("[ERROR] you must enter an integer in the interval [0;+infinity]")
    return choice


def create_folder_if_missing(path, folder_name):
    if not os.path.isdir(f"{path}/{folder_name}"):
        os.makedirs(f"{path}/{folder_name}")


# -------------------------------------------------Prettier terminal---------------------------------------------------#


class color:
    BLACK = '\u001b[30m'
    RED = '\u001b[31;1m'
    GREEN = '\u001b[32;1m'
    YELLOW = '\u001b[33;1m'
    BLUE = '\u001b[34m'
    MAGENTA = '\u001b[35m'
    CYAN = '\u001b[36m'
    WHITE = '\u001b[37;1m'
    RESET = '\u001b[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    BWHITE = '\u001b[47;1m'
    BBLUE = '\u001b[44;1m'
    BMAGENTA = '\u001b[45;1m'


def printw(string):
    print(color.WHITE + string + color.RESET)


def printy(string):
    print(color.YELLOW + string + color.RESET)


def printr(string):
    print(color.RED + string + color.RESET)


def inputw(string):
    user_input = input(color.WHITE + string + color.RESET)
    return user_input


def clear_terminal():
    os.system('clear')


def is_server_running(infos):
    output = check_output(args=["screen", "-ls"]).decode("utf-8")
    screen_pid = re.search(pattern=r"\d+",
                           string=re.search(pattern=rf"\d+\.{infos['server_screen_session_name']}",
                                            string=output
                                            )[0]
                           )[0]
    output = check_output(args=["pstree", "-pa", f"{screen_pid}"]).decode("utf-8")
    return re.search(pattern=rf"-jar .+?/spigot-", string=output)


def display_header(section_name, infos, filler=' '):
    columns, rows = os.get_terminal_size(0)

    fill = columns - len(section_name)
    running = f" Server:{color.GREEN}running{color.RESET}"
    down = f" Server:{color.RED}down{color.RESET}"

    if is_server_running(infos):
        fill = fill - len(running) + len(color.GREEN) + len(color.RESET)
        header = section_name + filler * fill + running
    else:
        fill = fill - len(down) + len(color.RED) + len(color.RESET)
        header = section_name + filler * fill + down

    clear_terminal()
    print(color.BBLUE + color.WHITE + color.BOLD + header)


def print_map_name_line(map_name):
    columns, rows = os.get_terminal_size(0)

    if map_name != '':
        fill = columns - 4 - len(map_name)
        if fill < 0:
            line = "Map:" + map_name[:columns-7] + "..."
        else:
            line = ' '*fill + "Map:" + map_name
        print(color.BBLUE + color.WHITE + color.BOLD + line + color.RESET)
    else:
        fill = columns - len("Map:Nameless")
        line = ' '*fill + "Map:Nameless"
        print(color.BBLUE + color.WHITE + color.BOLD + line + color.RESET)


def display_map_name(infos):
    path = infos['path_server_directory']
    if "server.properties" in os.listdir(path):
        wanted_parameter, parameter_list = get_parameter_lists(path=f"{path}/server.properties")
        index = wanted_parameter.index('map-name')
        map_name = parameter_list[index]
        print_map_name_line(map_name=map_name)


# ------------------------------------------------File managment related-------------------------------------------------#


def delete_actual_map(infos):
    screen_prefix = f"sudo -u {infos['user_name']} screen -S {infos['server_screen_session_name']} -X stuff"

    print("deleting files of the last map...")
    file_to_delete = ['world_the_end/', 'world_nether/', 'plugins/', 'server.properties', 'bukkit.yml']
    for i in range(len(file_to_delete)):
        os.system(f"{screen_prefix} 'sudo rm -rf {infos['path_server_directory']}/{file_to_delete[i]}^M'")

    command = f"sudo rm -rf {infos['path_server_directory']}/world/"
    os.system(f"{screen_prefix} '{command}^M'")

    while "world" in os.listdir(infos['path_server_directory']):
        time.sleep(0.5)
    time.sleep(1)
    print("files successfully deleted.")


def choose_directory_name(message1, message2):
    files_names = os.listdir("./Maps")
    forbiden_char = ["/", "<", ">", ":", '"', "\\", "|", "?", "*"]

    while True:
        valid_name = True
        printw(message1)
        name_enter = input()

        if name_enter in files_names:
            valid_name = False
            printw("An other save is already named this way, please choose an other name.")
        for char in forbiden_char:
            if char in name_enter:
                print(f"The name of the save can't contain one of those char : {''.join(forbiden_char)}")
                printw(message2)
                valid_name = False
        if valid_name:
            break
    return name_enter


# --------------------------------------------------Web scrap spigot---------------------------------------------------#


def get_versions_list():
    url = "https://getbukkit.org/download/spigot"
    req = urllib.request.Request(url, headers={'User-Agent': "Magic Browser"})
    rep = urllib.request.urlopen(req)
    bytes_html = rep.read()
    html = bytes_html.decode("utf-8")

    list_version = []
    list_url = []

    for line in html.splitlines():
        reExp = r"\<h2\>(1\.\d+\.?\d*?)\</h2\>"
        if re.search(pattern=reExp, string=line):
            version = re.search(pattern=reExp, string=line)[1]
            list_version.append(version)

        reExp = r"\<a href=\"(.*?)\"\ class=\"btn btn-download\"\ id=\"downloadr\"\><i class=\"fa fa-download fa\-fw\""
        if re.search(pattern=reExp, string=line):
            version = re.search(pattern=reExp, string=line)[1]
            list_url.append(version)

    return list_version, list_url


def get_version_name(index, list_url):
    url = list_url[index]

    req = urllib.request.Request(url, headers={'User-Agent': "Magic Browser"})
    rep = urllib.request.urlopen(req)
    bytes_html = rep.read()
    html = bytes_html.decode("utf-8")

    line_countdown = 0
    re_exp_mile_stone = r"\<p\>You're about to download:\</p\>"
    re_exp_url = r'\<a href=\"(.+?)\"\>Spigot-'
    re_exp_version = r'spigot-(.+?).jar'
    dl_url = ""
    for line in html.splitlines():
        if re.search(pattern=re_exp_mile_stone, string=line):
            line_countdown = 3
        if line_countdown > 0:
            line_countdown = line_countdown - 1
        if line_countdown == 1:
            dl_url = re.search(pattern=re_exp_url, string=line)[1]
    version_name = re.search(pattern=re_exp_version, string=dl_url)[1]
    return version_name


def choose_version(infos):
    display_header(section_name="■ Choose version ", infos=infos)
    try:
        list_version, list_url = get_versions_list()
        printw("Every versions supported by spigot :")
        display_indexed_in_columns(input_list=list_version, nb_of_columns=3, delimitation=" ")
        message = "Please choose the version you want by typing the number associated to it :"
        choosen_index = choose_index(list=list_version, message=message)
        version = get_version_name(index=choosen_index, list_url=list_url)
    except:
        display_header(section_name="■ Gernerate map ", infos=infos)
        printr("[ERROR] an error occurred in the previous stage of choosing the version")
        printw("Please type the version of the world you want to generate :")
        printw("for example 1.16.5")
        version = input()
    return version


# -------------------------------------------------Parameter related---------------------------------------------------#


def get_parameter_lists(path):
    wanted_parameter = ['version', 'gamemode', 'difficulty', 'online-mode', 'allow-nether', 'allow-end',
                        'enable-command-block', 'motd', 'map-name', 'max-players', 'hardcore', 'spawn-protection',
                        'level-seed', 'view-distance', 'resource-pack']
    parameter_dict = {}
    parameter_list = []

    # getting parameter in the properties file
    with open(path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            for i in range(len(wanted_parameter)):
                if re.search(pattern=rf"^{wanted_parameter[i]}=", string=line):
                    key = line[:line.find("=")]
                    value = line[line.find("=") + 1:].rstrip('\n')
                    parameter_dict[i] = {key: value}

    # adding unfound parameter missing to the parameter dict
    for i in range(len(wanted_parameter)):
        if i not in parameter_dict:
            parameter_dict[i] = {wanted_parameter[i]: ''}

    # converting the dictionary into a list
    for i in range(len(wanted_parameter)):
        parameter_list.append(parameter_dict[i][wanted_parameter[i]])

    return wanted_parameter, parameter_list


def make_displayable_parameter_list(wanted_parameter, parameter_list):
    displayable_list = []
    for i in range(len(wanted_parameter)):
        displayable_list.append(f"{wanted_parameter[i]}={parameter_list[i]}")
    return displayable_list


def choose_gamemode(infos):
    def display_gamemode():
        MENU = [
            f"0) survival",
            f"1) creative",
            f"2) adventure",
            f"3) spectator"
        ]
        printw("Type the number corresponding to the gamemode you want :")
        for item in MENU:
            print(item)

    while True:
        display_header(section_name="■ Choose parameters ", infos=infos)
        display_gamemode()
        choice = input()
        if (choice == '0' or choice == '1' or choice == '2' or choice == '3'):
            break
        else:
            printr("[ERROR] you must choose an integer between 0 and 3")
    return choice


def choose_difficulty(infos):
    def display_difficulty():
        MENU = [
            f"0) peaceful",
            f"1) easy",
            f"2) normal",
            f"3) hard"
        ]
        printw("Type the number corresponding to the gamemode you want :")
        for item in MENU:
            print(item)

    while True:
        display_header(section_name="■ Choose parameters ", infos=infos)
        display_difficulty()
        choice = input()
        if (choice == '0' or choice == '1' or choice == '2' or choice == '3'):
            break
        else:
            printr("[ERROR] you must choose an integer between 0 and 3")
    return choice


def toggle(parameter_list, index):
    if parameter_list[index] == "true":
        return "false"
    else:
        return "true"


def display_and_modify_parameter(infos, wanted_parameter, parameter_list):
    while True:
        display_header(section_name="■ Choose parameters ", infos=infos)
        displayable_list_parameter = make_displayable_parameter_list(wanted_parameter, parameter_list)
        displayable_list_parameter.insert(0, "to continue")
        display_indexed_in_columns(input_list=displayable_list_parameter, nb_of_columns=1, delimitation=' ')

        message = "Please choose the parameter you want to modify by typing the number associated to it :"
        choice = choose_index(list=displayable_list_parameter, message=message)

        if choice == 0:
            display_header(section_name="■ Choose parameters ", infos=infos)
            break

        choice = int(choice) - 1

        if wanted_parameter[choice] == 'version':
            index = wanted_parameter.index('version')
            parameter_list[index] = choose_version(infos=infos)
        elif wanted_parameter[choice] == 'gamemode':
            index = wanted_parameter.index('gamemode')
            parameter_list[index] = choose_gamemode(infos=infos)
        elif wanted_parameter[choice] == 'difficulty':
            index = wanted_parameter.index('difficulty')
            parameter_list[index] = choose_difficulty(infos=infos)
        elif wanted_parameter[choice] == 'online-mode':
            index = wanted_parameter.index('online-mode')
            parameter_list[index] = toggle(parameter_list=parameter_list, index=index)
        elif wanted_parameter[choice] == 'allow-nether':
            index = wanted_parameter.index('allow-nether')
            parameter_list[index] = toggle(parameter_list=parameter_list, index=index)
        elif wanted_parameter[choice] == 'allow-end':
            index = wanted_parameter.index('allow-end')
            parameter_list[index] = toggle(parameter_list=parameter_list, index=index)
        elif wanted_parameter[choice] == 'enable-command-block':
            index = wanted_parameter.index('enable-command-block')
            parameter_list[index] = toggle(parameter_list=parameter_list, index=index)
        elif wanted_parameter[choice] == 'motd':
            index = wanted_parameter.index('motd')
            parameter_list[index] = inputw("Type the motd of your map :")
        elif wanted_parameter[choice] == 'max-players':
            message = "Enter the maximum number of player who can join the server :"
            index = wanted_parameter.index('max-players')
            parameter_list[index] = input_integer(message=message)
        elif wanted_parameter[choice] == 'hardcore':
            index = wanted_parameter.index('hardcore')
            parameter_list[index] = toggle(parameter_list=parameter_list, index=index)
        elif wanted_parameter[choice] == 'spawn-protection':
            message = "Enter the number of spawn chunks protected :"
            index = wanted_parameter.index('spawn-protection')
            parameter_list[index] = input_integer(message=message)
        elif wanted_parameter[choice] == 'level-seed':
            index = wanted_parameter.index('level-seed')
            parameter_list[index] = inputw("Type the seed of your map :")
        elif wanted_parameter[choice] == 'view-distance':
            message = "Enter the number of spawn chunks protected :"
            index = wanted_parameter.index('view-distance')
            parameter_list[index] = input_integer(message=message, minimum=1)
        elif wanted_parameter[choice] == 'resource-pack':
            index = wanted_parameter.index('resource-pack')
            parameter_list[index] = inputw("Type the url of your resource pack :")
        elif wanted_parameter[choice] == 'map-name':
            index = wanted_parameter.index('map-name')
            parameter_list[index] = inputw("Type the name of the map :")
        else:
            printr("[ERROR] this choice isn't valid.")

    return parameter_list


def apply_parameters(path, wanted_parameter, parameter_list):
    files = os.listdir(path)

    if 'server.properties' not in files:
        print(f"server.properties file hasn't been found in {path}")
        shutil.copy(src="./Lib/templates/server.properties", dst=f"{path}")
        print(f"a server.properties file has been created")

    with open(f"{path}/server.properties", 'r') as f:
        lines = f.readlines()

    for p in range(len(wanted_parameter)):
        find = False
        for i in range(len(lines)):
            if re.search(rf"^{wanted_parameter[p]}=", lines[i]):
                find = True
                lines[i] = f"{wanted_parameter[p]}={parameter_list[p]}\n"
                break
        if not find:
            lines.append(f"{wanted_parameter[p]}={parameter_list[p]}\n")

    with open(f"{path}/server.properties", 'w') as f:
        for line in lines:
            f.write(line)

    if 'bukkit.yml' not in files:
        shutil.copy(src="./Lib/templates/bukkit.yml", dst=f"{path}")

    replace_in_file(file_path=f"{path}/bukkit.yml", regexEx=r"  allow-end: ",
                    replaced_with=f"  allow-end: {parameter_list[wanted_parameter.index('allow-end')]}")
    print("Parameters succesfully applied.")


# -----------------------------------------------------Change map------------------------------------------------------#


def choose_map(path_maps_directory):
    maps = os.listdir(path_maps_directory)
    chosen_map = ''

    if len(maps) > 0:

        while True:
            printw("Type the number corresponding to the map you want :")
            for i in range(len(maps)):
                print(f"{i}) - {maps[i]}")

            try:
                choice = input()
                choice = int(choice)
                if choice >= 0:
                    chosen_map = maps[choice]
                    break
            except:
                printr(f"[ERROR] Invalid input, you must type an integer included in the interval [0,{len(maps) - 1}]")
    else:
        printr("[ERROR] Your maps directory is empty")
    return chosen_map


def setup_map(infos, map_name):
    print("copying map...")
    path_here = os.path.realpath(os.path.dirname(__file__))

    my_copy_tree(src=f"{path_here}/Maps/{map_name}", dst=f"{infos['path_server_directory']}", dump=True)
    print("map successfully copied.")


def change_map(infos):
    display_header(section_name="■ Change map ", infos=infos)
    if is_server_running(infos=infos):
        message = "Generating a map will shutdown the running server, are you sure you want to stop the server ?"
        if not sure(confirmationMessage=message):
            print("No save have been done, server is still running.")
            return
        else:
            display_header(section_name="■ Change map ", infos=infos)

    choosenMapName = choose_map(path_maps_directory="./Maps")
    message = "You are about to overwrite the current map with the one you've just chosen, do you want to continue ?"
    if sure(confirmationMessage=message) and choosenMapName != '':
        print("Changing map please wait...")
        if is_server_running(infos=infos):
            stop_server(infos=infos, reason="We are changing the map, please wait.")
        delete_actual_map(infos=infos)
        setup_map(infos=infos, map_name=choosenMapName)
        # send_infos()
    else:
        print("No changes done.")


# ----------------------------------------------------Generate map-----------------------------------------------------#


def generate_map(infos):
    display_header(section_name="■ Gernerate map ", infos=infos)
    if is_server_running(infos=infos):
        message_stop = "Generating a map will shutdown the running server, are you sure you want to stop the server ?"
        if not sure(confirmationMessage=message_stop):
            print("No save done, server still running.")
            return
        else:
            display_header(section_name="■ Gernerate map ", infos=infos)


    message_overwrite = "You are about to overwrite the current map by creating this one, do you want to continue ?"
    if sure(confirmationMessage=message_overwrite):
        wanted_parameter, parameter_list = get_parameter_lists(path="./Lib/templates/server.properties")
        parameter_list[wanted_parameter.index('version')] = choose_version(infos)

        display_and_modify_parameter(infos=infos, wanted_parameter=wanted_parameter, parameter_list=parameter_list)
        if is_server_running(infos=infos):
            stop_server(infos=infos, reason="We are generating a new map, please wait.")
        delete_actual_map(infos)
        apply_parameters(path=infos['path_server_directory'],
                         wanted_parameter=wanted_parameter,
                         parameter_list=parameter_list)
        printw("Parameters successfully applied, start the server to generate the map.")
    else:
        print("No changes done.")


# ------------------------------------------------------Save map-------------------------------------------------------#


def create_a_save(save_name, infos):
    print("Backup in progress...")
    list_of_files_to_save = ["world", "world_nether", "world_the_end", "server.properties", "bukkit.yml",
                             "plugins", "work"]
    file_existing = os.listdir(infos["path_server_directory"])
    os.mkdir(path=f"./Maps/{save_name}")

    for file in list_of_files_to_save:
        if file in file_existing:
            if os.path.isdir(f"{infos['path_server_directory']}/{file}"):
                my_copy_tree(src=f"{infos['path_server_directory']}/{file}", dst=f"./Maps/{save_name}", dump=False)
            else:
                shutil.copy2(src=f"{infos['path_server_directory']}/{file}", dst=f"./Maps/{save_name}")
    print("Backup complete.")


def save_map(infos):
    display_header(section_name="■ Save ", infos=infos)
    if is_server_running(infos=infos):
        message = "Saving the map will shutdown the running server, are you sure you want to stop the server ?"
        if not sure(confirmationMessage=message):
            print("No save done, server still running.")
            return
        else:
            display_header(section_name="■ Save ", infos=infos)

    message1 = "Enter the name of your backup :"
    message2 = "Please choose an other name for your save."
    name_of_the_save = choose_directory_name(message1, message2)
    if is_server_running(infos=infos):
        stop_server(infos=infos, reason="We are making a backup, please wait.")
    create_a_save(save_name=name_of_the_save, infos=infos)


# -----------------------------------------------Modify map parameters-------------------------------------------------#


def ensure_server_properties_exist(path):
    files = os.listdir(path)

    if 'server.properties' not in files:
        print(f"server.properties file hasn't been found in {path}")
        shutil.copy(src="./Lib/templates/server.properties", dst=f"{path}")
        print("A server.properties file has been created.")


def modify_map_parameter(infos):
    display_header(section_name="■ Map parameters ", infos=infos)
    if is_server_running(infos=infos):
        message = "Modifying the map parameters will shutdown the running server, are you sure you want to stop the server ?"
        if not sure(confirmationMessage=message):
            print("No save done, server still running.")
            return
        else:
            display_header(section_name="■ Map parameters ", infos=infos)

    ensure_server_properties_exist(path=infos['path_server_directory'])
    wanted_parameter, parameter_list = get_parameter_lists(path=f"{infos['path_server_directory']}/server.properties")
    display_and_modify_parameter(infos=infos, wanted_parameter=wanted_parameter, parameter_list=parameter_list)
    if is_server_running(infos=infos):
        stop_server(infos=infos, reason="We are changing the map parameters, please wait.")
    apply_parameters(path=infos['path_server_directory'],
                     wanted_parameter=wanted_parameter,
                     parameter_list=parameter_list)


# ---------------------------------------------------Run the server----------------------------------------------------#


def start_server(infos):
    def display_menu_spigot_not_found():
        MENU = [
            "d) -to download and start",
            "q) -to quit",
        ]
        printw("Type the letter which corresponds to the action you want to execute :")
        for item in MENU:
            print(item)

    files = os.listdir(infos['path_server_directory'])

    if "server.properties" in files:
        wanted_parameter, parameter_list = get_parameter_lists(path=f"{infos['path_server_directory']}/server.properties")
        apply_parameters(path=infos['path_server_directory'],
                         wanted_parameter=wanted_parameter,
                         parameter_list=parameter_list)
        version = parameter_list[wanted_parameter.index('version')]
        if version == "":
            printr("[ERROR] you must set the version for the map before starting the server, choose the version in the map parameter menu.")
            return None
        server_launcher = f"spigot-{version}.jar"
        screen_prefix = f"sudo -u {infos['user_name']} screen -S {infos['server_screen_session_name']} -X stuff"
        command_start_server = infos['server_start_command']
        command_start_server = re.sub(r"{PATH_SERVER_DIRECTORY}", infos['path_server_directory'], command_start_server)
        command_start_server = re.sub(r"{VERSION_FOR_THE_MAP}", version, command_start_server)
        if server_launcher in files:
            print("starting the server...")
            os.system(f"{screen_prefix} 'cd {infos['path_server_directory']} && {command_start_server}^M'")
        else:
            printr(f"[ERROR] Can't find the spigot-{version}.jar file in {infos['path_server_directory']}")
            while True:
                display_menu_spigot_not_found()
                choice = input().lower()

                if choice == 'q':
                    print("The server didn't start.")
                    break
                elif choice == 'd':
                    print(f"You have chosen to try to download spigot-{version}.jar")
                    try:
                        print("Downloading...")
                        command = f"wget -P {infos['path_server_directory']} https://cdn.getbukkit.org/spigot/spigot-{version}.jar"
                        os.system(f"{screen_prefix} '{command}^M'")
                        print("Download complete.")
                        print("Starting server...")
                        os.system(f"{screen_prefix} '{command_start_server}^M'")
                        print(
                            "Server starting, if it fails to start, consider verifying if the spigot version you've chosen exist and check if the right version of java is installed.")
                        break
                    except:
                        printr("[ERROR] A problem has occurred while trying to download and start the server.")
                        break
                else:
                    printr("[ERROR] this choice isn't valid.")
        return None
    printr(f"[ERROR] server.properties file missing in {infos['path_server_directory']}")


def manual_server_start(infos):
    display_header(section_name="■ Start the server ", infos=infos)
    if not is_server_running(infos=infos):
        message = "You are about to start the server, do you want to continue ?"
        if sure(confirmationMessage=message):
            start_server(infos=infos)
        else:
            print("The server hasn't been started.")
    else:
        print("The server is already running.")


# ------------------------------------------------Turn off the server--------------------------------------------------#


def stop_server(infos, reason):
    screen_prefix = f"sudo -u {infos['user_name']} screen -S {infos['server_screen_session_name']} -X stuff"

    print("stopping the running server...")
    os.system(f"{screen_prefix} 'kick @a {reason}^M'")
    os.system(f"{screen_prefix} 'stop^M'")

    output = check_output(args=["screen", "-ls"]).decode("utf-8")
    screen_pid = re.search(pattern=r"\d+",
                           string=re.search(pattern=rf"\d+\.{infos['server_screen_session_name']}", string=output)[0])[
        0]

    output = check_output(args=["pstree", "-pa", f"{screen_pid}"]).decode("utf-8")
    while re.search(pattern=rf"{infos['path_server_directory']}/spigot-\d\.\d+\.\d+\.jar", string=output):
        time.sleep(0.5)
        output = check_output(args=["pstree", "-pa", f"{screen_pid}"]).decode("utf-8")
    time.sleep(1)

    os.system(f"{screen_prefix} 'cd {infos['path_server_directory']}^M'")
    print("server successfully stopped.")


def manual_server_stop(infos):
    display_header(section_name="■ Stop server ", infos=infos)
    if is_server_running(infos=infos):
        message = "You are about to stop the server, do you want to continue ?"
        if sure(confirmationMessage=message):
            printw("Type the kick message :")
            reason = input()
            stop_server(infos=infos, reason=reason)
    else:
        print("The server is already stopped.")


# ----------------------------------------------------Manage maps------------------------------------------------------#


def delete_save(map_name):
    deleted = False
    message = f'You are about to delete the map "{map_name}" do you want to continue ?'
    if sure(message):
        message = f'If you continue, the map "{map_name}" will be lost forever...'
        if sure(message):
            shutil.rmtree(f"./Maps/{map_name}")
            print("The map has been successfully deleted.")
            deleted = True
        else:
            print("The map hasn't been deleted.")
    else:
        print("The map hasn't been deleted.")
    return deleted


def rename_save(map_name):
    message1 = f'Enter the new name of "{map_name}" :'
    message2 = "Please choose an other name."
    new_map_name = choose_directory_name(message1, message2)
    os.rename(f"./Maps/{map_name}", f"./Maps/{new_map_name}")
    print(f'The name of "{map_name}" in now "{new_map_name}"')
    return new_map_name


def copy_save(map_name):
    message1 = f'Enter the name of the copy of "{map_name}" :'
    message2 = "Please choose an other name for the copy."
    copy_name = choose_directory_name(message1, message2)
    os.mkdir(f"./Maps/{copy_name}")
    my_copy_tree(f"./Maps/{map_name}", f"./Maps/{copy_name}")
    print(f'"{map_name}" has been successfully copied under the name of "{copy_name}"')


def manage_the_map(map_name, infos):
    def display_menu():
        MENU = [
            "d) -to delete the map",
            "r) -to rename the map",
            "c) -to make a copy of the map",
            "q) -to quit"
        ]
        printw(f"""You've' choosen the map "{map_name}""""")
        for item in MENU:
            print(item)
        printw("Type the letter which corresponds to the action you want to execute :")

    while True:
        display_header(section_name="■ Manage maps ", infos=infos)
        display_menu()
        choice = input().lower()

        if choice == 'd':
            deleted = delete_save(map_name=map_name)
            if deleted:
                break
            else:
                inputw("Press enter to return to the manage maps menu.")
        elif choice == 'r':
            map_name = rename_save(map_name)
            inputw("Press enter to return to the manage maps menu.")
        elif choice == 'c':
            copy_save(map_name)
            inputw("Press enter to return to the manage maps menu.")
        elif choice == 'q':
            break
        else:
            printr("[ERROR] this choice isn't valid.")


def manage_maps(infos):
    display_header(section_name="■ Manage maps ", infos=infos)
    choosenMapName = choose_map(path_maps_directory="./Maps")

    manage_the_map(map_name=choosenMapName, infos=infos)


# -----------------------------------------------------Main menu-------------------------------------------------------#


def menu():
    def display_menu():
        MENU = [
            "c) -to change map",
            "g) -to generate a new map",
            "s) -to save the current map",
            "p) -to modify map parameters",
            "r) -to run the server",
            "t) -to turn off the server",
            "m) -to manage your maps",
            "q) -to quit"
        ]
        printw("Type the letter which corresponds to the action you want to execute :")
        for item in MENU:
            print(item)

    infos = text2dic("./param_McMapDJ.txt")

    while True:
        display_header(section_name="■ Main menu ", infos=infos)
        display_map_name(infos=infos)
        display_menu()
        choice = input().lower()

        if choice == 'c':
            change_map(infos=infos)
        elif choice == 'g':
            generate_map(infos=infos)
        elif choice == 's':
            save_map(infos=infos)
        elif choice == 'p':
            modify_map_parameter(infos=infos)
        elif choice == 'r':
            manual_server_start(infos=infos)
        elif choice == 't':
            manual_server_stop(infos)
        elif choice == 'm':
            manage_maps(infos=infos)
        elif choice == 'q':
            print("Bye Bye !")
            time.sleep(0.5)
            clear_terminal()
            break
        else:
            printr("[ERROR] this choice isn't valid.")
        inputw("Press enter to return to the main menu.")


if __name__ == "__main__":
    create_folder_if_missing(path='.', folder_name='Maps')
    menu()
