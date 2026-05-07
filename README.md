# DeviceImpressTool

[![CI Status](https://img.shields.io/travis/crazyLuobo/DeviceImpressTool.svg?style=flat)](https://travis-ci.org/crazyLuobo/DeviceImpressTool)
[![Version](https://img.shields.io/cocoapods/v/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)
[![License](https://img.shields.io/cocoapods/l/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)
[![Platform](https://img.shields.io/cocoapods/p/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)

DeviceImpressTool 是一个 iOS 设备信息采集与图片压缩工具集，采用模块化设计，支持按需引入。

## 功能模块

| 模块 | 功能 | 依赖框架 |
|------|------|----------|
| **Device** | 设备信息（系统版本、屏幕分辨率、电池、CPU、设备型号、IDFA 等） | Foundation, UIKit, AppTrackingTransparency, AdSupport |
| **Network** | 网络信息（WiFi/蜂窝网络、VPN、代理、网络可达性） | Foundation, CoreTelephony, SystemConfiguration |
| **Storage** | 存储信息（内存、存储空间） | Foundation |
| **Time** | 时间信息（系统运行时间、进程运行时间、启动时间） | Foundation |
| **Broken** | 越狱检测 | Foundation |
| **Impress** | 图片压缩（200-600KB 上传策略） | Foundation, UIKit |
| **System** | 集成以上所有模块（默认 subspec） | Foundation |

### DeviceService - 设备信息
```objectivec
// 获取设备系统版本
[DeviceService deviceSystemVersion];

// 获取设备型号
[DeviceService deviceType];

// 获取电池电量（0.0 - 1.0）
[DeviceService deviceBatteryLevel];

// 获取设备信息字典
[DeviceService deviceSystemInfo];
```

### NetworkService - 网络信息
```objectivec
// 获取网络类型（WiFi/蜂窝网络/无网络）
[NetworkService deviceNetworkType];

// 检测网络是否可达
[NetworkService isNetworkReachable];

// 获取 WiFi 网络详细信息
[NetworkService deviceWiFiNetworkInfo];
```

### StorageService - 存储信息
```objectivec
// 获取存储信息字典
[StorageService deviceStorageInfo];

// 获取总内存大小（字节）
[StorageService deviceTotalMemorySize];

// 格式化存储大小
[StorageService formatStorageSize:1024];
```

### TimeService - 时间信息
```objectivec
// 获取系统运行时间
[TimeService deviceSystemUptime];

// 获取设备启动时间
[TimeService deviceBootTime];
```

### BrokenService - 越狱检测
```objectivec
// 检测设备是否已越狱
[BrokenService phoneBrokenStatus];
```

### ImpressService - 图片压缩
专为 200-600 KB 上传场景设计的图片压缩工具：
```objectivec
// 同步压缩
ImpressServiceOutput *output = [ImpressService compressImageForUploadKilobyteRange200To600:image error:nil];
NSData *compressedData = output.data;
NSString *base64String = output.base64;

// 异步压缩（后台执行，主线程回调）
[ImpressService compressImageForUploadKilobyteRange200To600:image completion:^(ImpressServiceOutput * _Nullable output, NSError * _Nullable error) {
    if (output) {
        // 压缩成功
        NSData *data = output.data;
    } else {
        // 压缩失败
    }
}];
```

### SystemService - 系统服务（需引入 System 模块）
```objectivec
SystemService *service = [[SystemService alloc] init];
NSDictionary *deviceInfo = [service deviceInfo];
```

## 系统要求

- iOS 10.0+
- Objective-C / Swift（支持 Clang 模块）

## 安装

### 方式一：全量引入（默认）

引入 `System` 模块及其所有依赖：

```ruby
pod 'DeviceImpressTool'
```

### 方式二：按需引入子模块

```ruby
# 仅引入设备信息模块
pod 'DeviceImpressTool/Device'

# 仅引入网络信息模块
pod 'DeviceImpressTool/Network'

# 仅引入存储信息模块
pod 'DeviceImpressTool/Storage'

# 仅引入时间信息模块
pod 'DeviceImpressTool/Time'

# 仅引入越狱检测模块
pod 'DeviceImpressTool/Broken'

# 仅引入图片压缩模块
pod 'DeviceImpressTool/Impress'
```

## Swift 支持

本库生成 Clang 模块，Swift 可直接 `import` 使用：

```swift
import DeviceImpressTool

// 使用示例
let version = DeviceService.deviceSystemVersion()
let isJailbroken = BrokenService.phoneBrokenStatus()
let networkType = NetworkService.deviceNetworkType()

// 图片压缩示例
let output = ImpressService.compressImageForUploadKilobyteRange200To600(image)
```

## 子模块依赖关系

```
DeviceImpressTool
├── System (默认)
│   ├── Broken
│   ├── Device
│   ├── Network
│   ├── Storage
│   ├── Time
│   └── Impress
```

## 示例项目

见 `Example/` 目录下的示例项目，运行前需先执行 `pod install`。

## 作者

crazyLuobo, yanwenbo_7820@163.com

## 许可证

DeviceImpressTool 基于 MIT 许可证开源，详见 LICENSE 文件。
