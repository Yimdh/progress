#include <stdio.h>

int main()
{
    int month;
    
    printf("몇월입니까 : ");
    scanf("%d",&month);
    
    if(month >= 3 && month<=5)
        printf("봄입니다.");
    else if(month >= 6 && month<=9)
        printf("여름입니다.");
    else if(month >= 10 && month<=11)
        printf("가을입니다.");
    else if(month ==1||month ==2||month ==12)
        printf("겨울입니다.");
    else
        printf("그런 월은 없습니다!!\n");
}
