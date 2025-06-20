//  WUINativeModule.m
//  ShareExt
//
//  Created by Ajay Grover on 03/04/25.
//

// WUINativeModule.mm
#import "WUINativeModule.h"

#import "ExtensionContextProvider.h"

@implementation WUINativeModule

RCT_EXPORT_MODULE(NativeShareUIModule);

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeShareUIModuleSpecJSI>(params);
}


- (void)completeRequest:(NSString *)isCompleted
                resolve:(RCTPromiseResolveBlock)resolve
                 reject:(RCTPromiseRejectBlock)reject {
    
  NSExtensionContext *context = [[ExtensionContextProviderImpl shared] getExtensionContext];

    if (context) {
        if ([isCompleted isEqualToString:@"true"]) {
            [context completeRequestReturningItems:nil completionHandler:^(BOOL expired) {
                if (resolve) {
                    resolve(@{@"success": @YES, @"expired": @(expired)});
                }
            }];
        } else {
            NSError *error = [NSError errorWithDomain:@"com.yourdomain"
                                              code:0
                                          userInfo:@{NSLocalizedDescriptionKey: @"Request cancelled by user"}];
            [context cancelRequestWithError:error];
            if (resolve) {
                resolve(@{@"success": @NO, @"cancelled": @YES});
            }
        }
    } else {
        if (reject) {
            NSError *error = [NSError errorWithDomain:@"com.yourdomain"
                                              code:1001
                                          userInfo:@{NSLocalizedDescriptionKey: @"Extension context not available"}];
            reject(@"NO_EXTENSION_CONTEXT", @"Extension context not available", error);
        }
    }
}

@end
