/* 
 * Description: Simple server implemntation C. Used to illustrate the
 * use of gotos.
 * IOCLA 2019
*/

#include <unistd.h> 
#include <stdio.h> 
#include <sys/socket.h> 
#include <stdlib.h> 
#include <netinet/in.h> 
#include <string.h> 
#define PORT 8080 

int main(void) 
{ 
    int server_fd, new_socket; 
    struct sockaddr_in address; 
    int opt = 1; 
    int addrlen = sizeof(address); 
    char *buffer = calloc(1024, sizeof(char)); 
    char *hello = "Hello from server"; 

	char error_buffer[100];

    if (buffer == NULL) {
        strcpy(error_buffer, "Buffer allocation failed!\n");
        goto exit_error;
    } 
       
    /* Creating socket file descriptor */
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
    { 
        strcpy(error_buffer, "Couldn't create socket!\n");
        goto buffFree;
    } 
       
    /* Forcefully attaching socket to the port 8080 */
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, 
                                                  &opt, sizeof(opt))) 
    {

		strcpy(error_buffer, "Couldn't attach socket!\n");
        goto buffFree;
    } 

    address.sin_family = AF_INET; 
    address.sin_addr.s_addr = INADDR_ANY; 
    address.sin_port = htons( PORT ); 
       
    if (bind(server_fd, (struct sockaddr *)&address,  
                                 sizeof(address))<0) 
    {

		strcpy(error_buffer, "Couldn't bind!\n");
        goto buffFree;

    } 

    if (listen(server_fd, 3) < 0) 
    { 

		strcpy(error_buffer, "Invalid listen!\n");
        goto srvClose;
    } 

    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
                       (socklen_t*)&addrlen))<0) 
    { 

		strcpy(error_buffer, "Invalid accept!\n");
        goto srvClose;

    } 

    read( new_socket , buffer, 1024); 
    printf("%s\n", buffer); 
    send(new_socket , hello , strlen(hello) , 0 ); 
    printf("Hello message sent\n"); 
	
    return 0; 

srvClose:
    close(server_fd);
buffFree:
    free(buffer);
exit_error:
    fprintf(stderr,"%s", error_buffer);
    return -1;
} 
