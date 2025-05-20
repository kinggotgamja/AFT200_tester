#include "AFT200D80_reader.hpp"

NRS_AFT200D80_render::~NRS_AFT200D80_render()
{
    close(clnt_sock);
}

void NRS_AFT200D80_render::TCP_connect(char *IP, int port)
{
    // 클라이언트 소켓 TCP/IP 프로토콜 생성
    clnt_sock = socket(PF_INET, SOCK_STREAM, 0);
    if (clnt_sock == -1)
        errhandle("socket() ERR!");

    // serv_sock에 bind로 주소 넣기 위한 밑작업
    memset(&st_serv_addr, 0, sizeof(st_serv_addr));
    st_serv_addr.sin_family = AF_INET;
    st_serv_addr.sin_addr.s_addr = inet_addr(IP);
    st_serv_addr.sin_port = htons(port);

    // connect()으로 서버소켓에 연결요청
    int connret = connect(clnt_sock, (struct sockaddr *)&st_serv_addr, sizeof(st_serv_addr));
    if (connret == -1)
    {errhandle("connect() ERR!");}
    else
    {printf("TCP/IP was connected: %s \n",IP);}
}
void NRS_AFT200D80_render::CAN_sender_input()
{
    int input;

    data_sel:
    std::cout << "Select the CAN ID(DEC): ";
    std::cin >> input;

    sendbuf[6] = input;

    std::cout << "Type the data to send(DEC): ";
    for(int i=0;i<7;i++)
    {
        std::cin >> input;
        sendbuf[7+i] = input;
        printf("ID:%d, Data(%d): %d, %d, %d, %d, %d, %d, %d \n",
        sendbuf[6], i, sendbuf[7],sendbuf[8],sendbuf[9],sendbuf[10],
        sendbuf[11],sendbuf[12],sendbuf[13]);
    }
    printf("Data was fully selected. Send?(yes:1, no:0) -> ");
    std::cin >> input;
    if(input == 0)
    {goto data_sel;}
}
void NRS_AFT200D80_render::CAN_send()
{
    int iResult = send(clnt_sock, sendbuf, sizeof(sendbuf), 0);
    printf("Bytes Sent: %d\n", iResult);
}
void NRS_AFT200D80_render::CAN_start()
{
    readstrlen = read(clnt_sock, (char *)&recvmsg, sizeof(recvmsg));
    if (readstrlen == -1) {
        errhandle("read() ERR!");
    } else {
        int id = (int)recvmsg[4];
        struct timeval current_time;
        gettimeofday(&current_time, NULL);  // Get current time

        // Update last time for this ID
        last_time[id] = current_time;

        if(recvmsg[4] == sendbuf[6])
        {
            long sec_diff = current_time.tv_sec - last_time[id].tv_sec;
            long usec_diff = current_time.tv_usec - last_time[id].tv_usec;
            double elapsed_ms = (double)(sec_diff * 1000000 + usec_diff) / 1000.0;

            for (int i = 0; i < 3; i++)
            {
                inter_force[i] = (double)((int)recvmsg[6 + 2 * i] * 256 + (int)recvmsg[7 + 2 * i]) / 100 - 300;
            }

            printf("ID: %d(%.1f), F_x: %d, F_y: %d, F_z: %d, %d, %d, %d \n", id, elapsed_ms,
                 inter_force[0], inter_force[1], inter_force[2]);
        }
        else if(recvmsg[4] == sendbuf[6]+1)
        {
            long sec_diff = current_time.tv_sec - last_time[id].tv_sec;
            long usec_diff = current_time.tv_usec - last_time[id].tv_usec;
            double elapsed_ms = (double)(sec_diff * 1000000 + usec_diff) / 1000.0;

            for (int i = 0; i < 3; i++)
            {
                inter_moment[i] = (double)((int)recvmsg[6 + 2 * i] * 256 + (int)recvmsg[7 + 2 * i]) / 500 - 50;
            }

            printf("ID: %d(%.1f), M_x: %d, M_y: %d, M_z: %d, %d, %d, %d \n", id, elapsed_ms,
                 inter_moment[0], inter_moment[1], inter_moment[2]);
        }
    
    }
}
void NRS_AFT200D80_render::errhandle(const char *errmsg)
{ // for FT_communication
    fputs(errmsg, stderr);
    fputc('\n', stderr);
    close(clnt_sock);
    exit(1);
}

int main()
{

    NRS_AFT200D80_render NRS_AFT200D80;

    NRS_AFT200D80.TCP_connect("192.168.0.55",4001);
    NRS_AFT200D80.CAN_sender_input();
    NRS_AFT200D80.CAN_send();

    while(true)
    {
        NRS_AFT200D80.CAN_start();
        usleep(1000); // 1ms delay = 1000 microseconds
    }

    return 0;
}