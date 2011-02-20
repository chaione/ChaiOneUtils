/*
 *  CHLogging.h
 *  ChaiOneUtils
 *
 *  Copyright (c) 2011 ChaiOne Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */


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
