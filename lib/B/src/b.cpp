#include "b.h"

#include <a1/a1.h>
#include <iostream>

void b(const std::string& prefix)
{
    std::cout << prefix << ": B" << std::endl;
    a1("From B");
}
