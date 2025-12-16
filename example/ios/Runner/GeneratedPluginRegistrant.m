//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<integration_test/IntegrationTestPlugin.h>)
#import <integration_test/IntegrationTestPlugin.h>
#else
@import integration_test;
#endif

#if __has_include(<system_beep_player/BeepSoundPlugin.h>)
#import <system_beep_player/BeepSoundPlugin.h>
#else
@import system_beep_player;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [IntegrationTestPlugin registerWithRegistrar:[registry registrarForPlugin:@"IntegrationTestPlugin"]];
  [BeepSoundPlugin registerWithRegistrar:[registry registrarForPlugin:@"BeepSoundPlugin"]];
}

@end
