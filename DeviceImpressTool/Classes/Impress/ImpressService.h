//
//  ImpressService.h
//  DeviceImpressTool
//
//  Objective-C：仅公开 200–600 KB 上传压缩。
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const ImpressServiceErrorDomain;

typedef NS_ERROR_ENUM(ImpressServiceErrorDomain, ImpressServiceErrorCode) {
    ImpressServiceErrorInvalidKBRange = 1,
    ImpressServiceErrorUnableToEncode = 2,
    ImpressServiceErrorUnableToReachTarget = 3,
};

@class ImpressServiceOutput;

/// 200–600 KB 上传策略异步完成（成功时 `error == nil`；失败时 `output == nil`）。
typedef void (^ImpressServiceUpload200to600Completion)(ImpressServiceOutput * _Nullable output, NSError * _Nullable error);

/// 压缩结果：`data` 多为 JPEG；`base64` 首次访问时惰性计算并缓存。
@interface ImpressServiceOutput : NSObject

@property (nonatomic, copy, readonly) NSData *data;
@property (nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, copy, readonly) NSString *base64;

- (instancetype)initWithData:(NSData *)data image:(UIImage *)image NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

/// 200–600 KB 上传压缩（长边 cap 4096、长边下限 256 等）。
@interface ImpressService : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// 200–600 KB 上传策略；仅 `UIImage`。
+ (nullable ImpressServiceOutput *)compressImageForUploadKilobyteRange200To600:(UIImage *)image
                                                                          error:(NSError * _Nullable * _Nullable)outError;

/// 同上，后台队列执行，主线程回调 `completion`（不可为 `NULL`）。
+ (void)compressImageForUploadKilobyteRange200To600:(UIImage *)image
                                          completion:(ImpressServiceUpload200to600Completion)completion;

@end

NS_ASSUME_NONNULL_END
