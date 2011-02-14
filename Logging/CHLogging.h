//
//  CHLogging.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//


#define CHVERBOSE				1
//#undef CHVERBOSE

#define CONCATSPACE(s1, s2)		s1 s2

/*
 Trace Macro
 */
#define CHTRACE(...) NSLog(__VA_ARGS__);


/*
 Function Entry Macro 
 */
#ifdef CHVERBOSE
#	define CHTRACE_ENTRY NSLog(@"[ENTRY] %s (%d)", __PRETTY_FUNCTION__, __LINE__);
#else
#	define CHTRACE_ENTRY
#endif


/*
 Function Exit Macro
 */
#ifdef CHVERBOSE
#	define CHTRACE_EXIT NSLog(@"[EXIT] %s (%d)", __PRETTY_FUNCTION__, __LINE__);
#else
#	define CHTRACE_EXIT
#endif


/*
 Informational Message
 */
#ifdef CHVERBOSE
#	define CHINFO(msg) CHTRACE(@CONCATSPACE("[INFO] %s (%d): ", msg), __PRETTY_FUNCTION__, __LINE__)
#else
#	define CHINFO(msg)
#endif


/*
 Debug Message
 */
#ifdef DEBUG
#	define CHDEBUG(fmt, ...) CHTRACE(@CONCATSPACE("[DEBUG] %s (%d): ", fmt), __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__)
#else
#	define CHDEBUG(fmt, ...)
#endif


/*
 Error Message
 */
#define CHERROR(fmt, ...) CHTRACE(@CONCATSPACE("[ERROR] %s (%d): ", fmt), __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__)


/*
 NSError trace
 */
#define CHNSERROR(err) if(err) {						\
	CHTRACE(@"[NSError] %s (%d): (%d:%@) Reason: %@",	\
		__PRETTY_FUNCTION__,							\
		__LINE__,										\
		err.code,										\
		err.domain,										\
		err.localizedDescription)						\
}


/*
 Exception Message
 */
#define CHEXCEPTION(e) if(e) {							\
	CHTRACE(@"[EXCEPTION] %s (%d): %@ (%@ || %@)",		\
		__PRETTY_FUNCTION__,							\
		__LINE__,										\
		e.name,											\
		e.reason,										\
		e.userInfo)										\
}
