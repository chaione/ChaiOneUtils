//
//  CHLogging.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

/*!
 @define CHVERBOSE
 @discussion Enable or disable extra logging output.
 */
#define CHVERBOSE				1
//#undef CHVERBOSE

#define CONCATSPACE(s1, s2)		s1 s2

/*!
 @define CHTRACE
 @discussion Trace Macro
 */
#define CHTRACE(...) NSLog(__VA_ARGS__);


/*
 @define CHTRACE_ENTRY
 @discussion Function Entry Macro 
 */
#ifdef CHVERBOSE
#	define CHTRACE_ENTRY NSLog(@"[ENTRY] %s (%d)", __PRETTY_FUNCTION__, __LINE__);
#else
#	define CHTRACE_ENTRY
#endif


/*
 @define CHTRACE_EXIT
 @discussion Function Exit Macro
 */
#ifdef CHVERBOSE
#	define CHTRACE_EXIT NSLog(@"[EXIT] %s (%d)", __PRETTY_FUNCTION__, __LINE__);
#else
#	define CHTRACE_EXIT
#endif


/*
 @define CHINFO
 @param msg
 @discussion Informational Message
 */
#ifdef CHVERBOSE
#	define CHINFO(msg) CHTRACE(@CONCATSPACE("[INFO] %s (%d): ", msg), __PRETTY_FUNCTION__, __LINE__)
#else
#	define CHINFO(msg)
#endif


/*
 @define CHDEBUG
 @param fmt
 @param ...
 @discussion Debug Message
 */
#ifdef DEBUG
#	define CHDEBUG(fmt, ...) CHTRACE(@CONCATSPACE("[DEBUG] %s (%d): ", fmt), __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__)
#else
#	define CHDEBUG(fmt, ...)
#endif


/*
 @define CHERROR
 @param fmt
 @param ...
 @discussion Error Message
 */
#define CHERROR(fmt, ...) CHTRACE(@CONCATSPACE("[ERROR] %s (%d): ", fmt), __PRETTY_FUNCTION__, __LINE__, __VA_ARGS__)


/*
 @define CHNSERROR
 @param err
 @discussion NSError trace
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
 @define CHEXCEPTION
 @param e
 @discussion Exception Message
 */
#define CHEXCEPTION(e) if(e) {							\
	CHTRACE(@"[EXCEPTION] %s (%d): %@ (%@ || %@)",		\
		__PRETTY_FUNCTION__,							\
		__LINE__,										\
		e.name,											\
		e.reason,										\
		e.userInfo)										\
}
