#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include "helpers.hpp"

std::string VERSION = "1.1.0";

void help(char* prompt){
    std::cout << "iswitch usage:" << std::endl;
    std::cout << prompt << " internal" << std::endl;
    std::cout << prompt << " external" << std::endl;
    std::cout << prompt << " --version" << std::endl;
    std::exit(EXIT_FAILURE);
}

void internal(){
    std::cout << "Switching to internal..." << std::endl;
    std::ifstream internal("internal.config");
    if(!internal.is_open()){
        std::cout << "Unable to open internal config file!" << std::endl;
        std::exit(EXIT_FAILURE);
    }
    std::ofstream hosts("hosts");
    if(!hosts.is_open()){
        std::cout << "Unable to open hosts file!" << std::endl;
        std::exit(EXIT_FAILURE);
    }
    char temp;
    while(!internal.eof()){
        internal.get(temp);
        hosts.put(temp);
    }
    internal.close();
    hosts.close();
}

void external(){
    std::cout << "Switching to external..." << std::endl;
    std::ifstream external("external.config");
    if(!external.is_open()){
        std::cout << "Unable to open external config file!" << std::endl;
        std::exit(EXIT_FAILURE);
    }
    std::ofstream hosts("hosts");
    if(!hosts.is_open()){
        std::cout << "Unable to open hosts file!" << std::endl;
        std::exit(EXIT_FAILURE);
    }
    char temp;
    while(!external.eof()){
        external.get(temp);
        hosts.put(temp);
    }
    external.close();
    hosts.close();
}

void version(){
    std::cout << "iswitch " << VERSION << std::endl;
    std::exit(EXIT_SUCCESS);
}
