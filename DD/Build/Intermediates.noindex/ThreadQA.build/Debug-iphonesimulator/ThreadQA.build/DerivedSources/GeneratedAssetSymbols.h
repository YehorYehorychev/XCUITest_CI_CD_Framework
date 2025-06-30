#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "MainLogo" asset catalog image resource.
static NSString * const ACImageNameMainLogo AC_SWIFT_PRIVATE = @"MainLogo";

/// The "ProfileLogo" asset catalog image resource.
static NSString * const ACImageNameProfileLogo AC_SWIFT_PRIVATE = @"ProfileLogo";

#undef AC_SWIFT_PRIVATE
