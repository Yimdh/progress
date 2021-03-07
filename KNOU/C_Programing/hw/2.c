#include <stdio.h>

int main()
{
    int number,i;
    
    for(;;){
        scanf("%d",&number);
        if(number==0) { 
            printf("프로그램을 종료합니다.*^^*");
            printf("컴퓨터과학과\n");
            break;
        }
        else if(number<1||number >10){
            printf("1부터10 사이 숫자를 입력하시오");
        }
        else if(number%2==0){
            printf("홀수를입력하시오*^^* 이름 : 임대환");
        }
        else if(number%2!=0){
            for(i=1;i<10;i++){
                printf("%d * %d = %d\n",number,i,i*number);
            }
        }
    }
}
