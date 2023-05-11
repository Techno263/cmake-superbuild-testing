#include <a1/a1.h>
#include <a2/a2.h>
#include <b.h>
#include <c.h>
#include <iostream>
#include <string>

int main(int argc, char* argv[])
{
    std::cout << "Start" << std::endl;
    std::string prefix =  "From main";
    a1(prefix);
    a2(prefix);
    b(prefix);
    c(prefix);
    std::cout << "Done" << std::endl;
}
