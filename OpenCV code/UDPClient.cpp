#include "UDPClient.h"


#include "PracticalSocket.h"  // For UDPSocket and SocketException
#include <iostream>           // For cout and cerr
#include <cstdlib>            // For atoi()

#ifdef WIN32
#include <windows.h>          // For ::Sleep()
void sleep(unsigned int seconds) {::Sleep(seconds * 1000);}
#else
#include <unistd.h>           // For sleep()
#endif

//using namespace std;


UDPClient::UDPClient(string dAddress, unsigned short dPort)
{
	destAddress = dAddress;             
	destPort = dPort;
	
	hasConnection = false;
	
	const char testString = "testing connection";
	
	try {
		sock.sendTo(testString, strlen(testString), destAddress, destPort);
		hasConnection = true;
		
	} catch (SocketException &e) {
		cerr << e.what() << endl;
		hasConnection = false;
	}
}

void UDPCLient::SendString(string datagram)
{
	try {
		sock.sendTo(testString, strlen(testString), destAddress, destPort);
		hasConnection = true;
		
	} catch (SocketException &e) {
		cerr << e.what() << endl;
		hasConnection = false;
	}
}
};

