/* 
 * Description: Simple client implemntation C. Used to illustrate the
 * use of gotos.
 * IOCLA 2019
*/

#include <stdio.h> 
#include <sys/socket.h> 
#include <arpa/inet.h> 
#include <unistd.h> 
#include <string.h> 
#include <stdlib.h> 
#define PORT 8080 
   
int main(void) 
{ 
    int sock = 0; 
    struct sockaddr_in serv_addr; 
    char *hello = "Hello from client"; 
    char *buffer = calloc(1024, sizeof(char)); 

	char error_buffer[100];

    if (buffer == NULL)
    {
        strcpy(error_buffer, "Buffer allocation failed!\n");
        goto exit_error;
    } 

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) 
    { 
        strcpy(error_buffer, "Couldn't open socket!\n");
        goto buffFree;
    } 
   
    serv_addr.sin_family = AF_INET; 
    serv_addr.sin_port = htons(PORT); 
       
    if(inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr)<=0)  
    {
        strcpy(error_buffer, "Invalid adress!\n");
        goto sockClose;
    } 
   
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) 
    { 
        strcpy(error_buffer, "Connection failed!\n");
        goto sockClose;
    } 

    send(sock , hello , strlen(hello) , 0 ); 
    printf("Hello message sent\n"); 
    read( sock , buffer, 1024); 
    printf("%s\n",buffer ); 
    return 0; 

    /*
    * Label for the error message
    *
    */

sockClose:
    shutdown(sock, SHUT_RDWR);
buffFree:
    free(buffer);
exit_error:
    fprintf(stderr,"%s", error_buffer);
    return -1;
} 
