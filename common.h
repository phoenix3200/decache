#include <iostream>

#include <sys/stat.h>
#include <mach-o/loader.h>
#include <mach-o/nlist.h>
#include <mach-o/reloc.h>

#include <fcntl.h>
#include <sys/mman.h>
#include <map>
#include <syslog.h>


#define LC_SOURCE_VERSION 0x2A


#ifdef TARGET_IPHONE
	#include <CommonCrypto/CommonDigest.h>
	#define SHA1 CC_SHA1
#else
	#include <openssl/sha.h>
#endif


#define CommonLog_old(fmt, ...) \
	{ \
		syslog(5, fmt, ##__VA_ARGS__); \
		fprintf(stdout, fmt "\n", ##__VA_ARGS__); \
	}
	
#define CommonLog(fmt, ...) \
	{ \
		syslog(5, "%s/%d: " fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
		fprintf(stdout, "%s/%d: " fmt "\n", __FUNCTION__, __LINE__, ##__VA_ARGS__); \
	}

#define PANIC(fmt, ...) \
	{ \
		CommonLog_old("Panic encountered at %s (%d): " fmt , __FUNCTION__, __LINE__, ##__VA_ARGS__); \
		abort(); \
	}


#define LINE() \
	{ \
		CommonLog_old("%s %s %d", __FILE__, __FUNCTION__, __LINE__); \
	}


