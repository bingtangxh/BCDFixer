#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main(int argc,char *argv[]){
    int slt,i=0;
    system("title 启动项目管理系统");
    puts("[1] 登录系统");
    puts("[2] 退出系统");
    puts("[3] 关闭电脑");
    puts("请输入您的选择对应的编号，然后按下Enter");
    mainMenu:
    slt=getche();
    switch (slt)
    {
    case '1':
        system("cls");
        goto login;
    
    case '2':
        exit(0);

    case '3':
        system("shutdown -s -t 60");
        exit(0);

    default:
        goto mainMenu;
    }
    login:
    //system("pause");
    system("if not exist user.txt copy nul user.txt");
    FILE* user;
    user=fopen("user.txt","rt+");
    FILE* user1=user;
    if(fgetc(user1)==-1){
        system("cls");
        puts("您好，当前没有用户。\n\n请")
    }
    puts("请输入用户名：");
    char userName[51];
    while(fgets(userName,51,stdin)==NULL){
        puts("您的输入过长或有误。\n\n最多只能输入50个字符。\n\n请按任意键，然后重试。\n");
        getchar();
    }
    while(userName[i]!='\n'&&userName[i]!='\0'){
        i++;
    }
    userName[i]='\0';
    i=0;
    
    end:
}
