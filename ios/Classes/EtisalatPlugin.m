#import "EtisalatPlugin.h"
#if __has_include(<etisalat/etisalat-Swift.h>)
#import <etisalat/etisalat-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "etisalat-Swift.h"
#endif

@implementation EtisalatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEtisalatPlugin registerWithRegistrar:registrar];
}
@end
