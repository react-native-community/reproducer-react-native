//
//  ExtensionContextProvider.h
//  ZellerApp
//
//  Created by Nehal Sanklecha on 19/06/25.
//

#import <Foundation/Foundation.h>

@protocol ExtensionContextProvider <NSObject>
- (NSExtensionContext *)getExtensionContext;
@end

@interface ExtensionContextProviderImpl : NSObject <ExtensionContextProvider>
+ (instancetype)shared;
- (void)setExtensionContext:(NSExtensionContext *)context;
@end
