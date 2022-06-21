#include <iostream>
#include <string>
#include "helpers.hpp"

int main(int cargs, char* args[]){
    if(cargs < 2){
        help(args[0]);
    }
    std::string choice = static_cast<std::string>(args[1]);
    if(choice == "internal"){
        internal();
    }else if(choice == "external"){
        external();
    }else{
        help(args[0]);
    }
    std::cout << "Done!" << std::endl;
}
