#ifndef CORK_H
#define CORK_H

#include <string>
typedef unsigned int size_t;

void Cork_ReportMemoryLeaks(void);
void * operator new (size_t size, std::string file, unsigned int line);

#define TBL_SIZE       512
#define _new           new (__FILE__,__LINE__)

#endif
