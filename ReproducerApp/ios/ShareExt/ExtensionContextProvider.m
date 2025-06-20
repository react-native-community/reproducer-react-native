//
//  ExtensionContextProvider.m
//  ShareExt
//
//  Created by Nehal Sanklecha on 19/06/25.
//

#import <Foundation/Foundation.h>
#import "ExtensionContextProvider.h"

@interface ExtensionContextProviderImpl ()
@property (nonatomic, strong) NSExtensionContext *extensionContext;
@end

@implementation ExtensionContextProviderImpl

+ (instancetype)shared {
    static ExtensionContextProviderImpl *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ExtensionContextProviderImpl alloc] init];
    });
    return instance;
}

- (NSExtensionContext *)getExtensionContext {
    return self.extensionContext;
}

- (void)setExtensionContext:(NSExtensionContext *)context {
    self.extensionContext = context;
}

@end
