#!/bin/bash
clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
echo""
echo -e "${RED}                                                                "                                                                                  
echo "
 __    __   ____  __ __   ____  ____    ____       _____   ___    __  __ __  ____   ____  ______  __ __ 
|  |__|  | /    ||  |  | /    ||    \  /    |     / ___/  /  _]  /  ]|  |  ||    \ |    ||      ||  |  |
|  |  |  ||  o  ||  |  ||  o  ||  _  ||   __|    (   \_  /  [_  /  / |  |  ||  D  ) |  | |      ||  |  |
|  |  |  ||     ||  ~  ||     ||  |  ||  |  |     \__  ||    _]/  /  |  |  ||    /  |  | |_|  |_||  ~  |
|  `  `  ||  _  ||___, ||  _  ||  |  ||  |_ |     /  \ ||   [_/   \_ |  :  ||    \  |  |   |  |  |___, |
 \      / |  |  ||     ||  |  ||  |  ||     |     \    ||     \     ||     ||  .  \ |  |   |  |  |     |
  \_/\_/  |__|__||____/ |__|__||__|__||___,_|      \___||_____|\____| \__,_||__|\_||____|  |__|  |____/ 
                                                                                                        "
echo "                                                               "                                                                    
echo -e "${GREEN}                                           -Coded By Wayang Linux ${NC}"
echo ""
echo -e "${YELLOW}  ${NC} "
echo ""
echo "---------------------------------------------------------------------------------------"
echo ""
echo -e "${RED}[!] This Tool Must Run As ROOT [!]${NC}"
echo ""
echo -e "${CYAN}[>] Press ENTER to Install Wayang Tools, CTRL+C to Abort.${NC}"
read INPUT
echo ""

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/WayangTools"
    BIN_DIR="$PREFIX/usr/bin/"
    pkg install -y git python2
else
    INSTALL_DIR="/usr/share/doc/WayangTools"
    BIN_DIR="/usr/bin/"
fi

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[!] A Directory WayangTools Was Found.. Do You Want To Replace It ? [y/n]:" ;
    read mama
    if [ "$mama" = "y" ]; then
        rm -R "$INSTALL_DIR"
    else
        exit
    fi
fi

echo "[✔] Installing ...";
echo "";
git clone https://github.com/WayangLinux/WayangTools.git "$INSTALL_DIR";
echo "#!/bin/bash
python $INSTALL_DIR/wayangtools.py" '${1+"$@"}' > WayangTools;
chmod +x WayangTools;
sudo cp WayangTools /usr/bin/;
rm WayangTools;


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Successfuly Installed !!! [✔]";
    echo "";
    echo "[✔]========================================================================[✔]";
    echo "[✔] ✔✔✔ All Is Done!! you can execute tool by typing WayangTools !! ✔✔✔ [✔]";
    echo "[✔]========================================================================[✔]";
    echo "";
else
    echo "[✘] Installation Failed !!! [✘]";
    exit
fi