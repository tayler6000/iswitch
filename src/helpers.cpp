#include <cstdlib>
#include <fstream>
#include <iostream>
#include "helpers.hpp"

void help(char* prompt){
    std::cout << "iswitch usage:" << std::endl;
    std::cout << prompt << " internal" << std::endl;
    std::cout << prompt << " external" << std::endl;
    std::exit(EXIT_FAILURE);
}

void internal(){
    std::cout << "Switching to internal..." << std::endl;
    std::ifstream internal("internal.txt");
    std::ofstream hosts("hosts");
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
    std::ifstream external("external.txt");
    std::ofstream hosts("hosts");
    char temp;
    while(!external.eof()){
        external.get(temp);
        hosts.put(temp);
    }
    external.close();
    hosts.close();
}
