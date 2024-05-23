//#pragma comment(lib, "Ole32.lib")
//需要ole32.dll，如果使用MinGW/gcc，那就gcc命令行加上-lole32
#include <combaseapi.h>
#include <cstdio>

using namespace std;

int main(void)
{
    char buffer[64]={'\0'};
    GUID guid;
    if (CoCreateGuid(&guid)) {
        fputs("create guid error\n",stderr);
        return -1;
    } else {
        _snprintf(buffer, sizeof(buffer),
            "%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X",
            guid.Data1, guid.Data2, guid.Data3,
            guid.Data4[0], guid.Data4[1], guid.Data4[2], guid.Data4[3],
            guid.Data4[4], guid.Data4[5], guid.Data4[6], guid.Data4[7]
            );
        puts(buffer);
        return 0;
    }
}