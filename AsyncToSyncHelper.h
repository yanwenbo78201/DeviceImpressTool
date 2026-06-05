//
//  AsyncToSyncHelper.h
//  DeviceImpressTool
//
//  Created by Computer  on 05/06/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AsyncToSyncHelper : NSObject
+ (id)syncExecute:(void(^)(void(^completion)(id result)))asyncBlock timeout:(NSTimeInterval)timeout;
@end

NS_ASSUME_NONNULL_END
