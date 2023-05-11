#include "a2.h"

#include <iostream>
#include <a1/a1.h>

void a2(const std::string& prefix)
{
    std::cout << prefix << ": A2" << std::endl;
    a1("From A2");
}
