//
//  FYViewController.m
//  DeviceImpressTool
//
//  Created by crazyLuobo on 05/06/2026.
//  Copyright (c) 2026 crazyLuobo. All rights reserved.
//

#import "FYViewController.h"
#import <DeviceImpressTool/SystemService.h>
#import <DeviceImpressTool/ImpressService.h>

@interface FYViewController ()

@end

@implementation FYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",[[SystemService new] deviceInfo]);
    [ImpressService compressImageForUploadKilobyteRange200To600:[UIImage imageNamed:@"big.JPEG"] completion:^(ImpressServiceOutput * _Nullable output, NSError * _Nullable error) {
        if (output) {
            // 压缩成功
            NSData *data = output.data;
            NSLog(@"压缩成功--%@",data);
        } else {
            // 压缩失败
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
