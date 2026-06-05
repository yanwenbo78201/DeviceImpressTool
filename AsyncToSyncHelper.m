//
//  AsyncToSyncHelper.m
//  DeviceImpressTool
//
//  Created by Computer  on 05/06/26.
//

#import "AsyncToSyncHelper.h"

@implementation AsyncToSyncHelper
+ (id)syncExecute:(void(^)(void(^completion)(id result)))asyncBlock timeout:(NSTimeInterval)timeout {
    __block id result = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    asyncBlock(^(id asyncResult) {
        result = asyncResult;
        dispatch_semaphore_signal(semaphore);
    });

    dispatch_time_t timeoutTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC));
    dispatch_semaphore_wait(semaphore, timeoutTime);

    return result;
}
@end
