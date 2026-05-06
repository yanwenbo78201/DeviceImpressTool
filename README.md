# DeviceImpressTool

[![CI Status](https://img.shields.io/travis/crazyLuobo/DeviceImpressTool.svg?style=flat)](https://travis-ci.org/crazyLuobo/DeviceImpressTool)
[![Version](https://img.shields.io/cocoapods/v/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)
[![License](https://img.shields.io/cocoapods/l/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)
[![Platform](https://img.shields.io/cocoapods/p/DeviceImpressTool.svg?style=flat)](https://cocoapods.org/pods/DeviceImpressTool)

DeviceImpressTool 是一个 iOS 设备信息采集与图片压缩工具集，提供设备信息、网络状态、存储信息、时间信息、越狱检测、图片压缩等功能。

## 功能模块

### DeviceService - 设备信息
获取 iOS 设备相关信息：
- 系统版本、应用版本
- 屏幕分辨率、屏幕亮度
- CPU 数量、电池电量、电池充电状态
- 设备类型（型号）、设备名称
- 广告标识符 (IDFA)
- 默认语言、时区
- 调试器检测、模拟器检测

### NetworkService - 网络信息
获取 iOS 设备网络相关状态：
- 网络连接类型（WiFi/蜂窝网络/其他）
- 详细网络类型
- WiFi 网络信息
- VPN 连接状态
- 代理设置状态
- 网络可达性检测

### StorageService - 存储信息
获取 iOS 设备存储状态：
- 总内存、已用内存
- 总存储空间、可用存储空间
- 存储大小格式化

### TimeService - 时间信息
获取 iOS 设备时间相关状态：
- 设备系统运行时间
- 进程运行时间
- 设备启动时间

### BrokenService - 越狱检测
- 检测设备是否已越狱

### ObjcImgPressAnTool - 图片压缩
专为 200-600 KB 上传场景设计的图片压缩工具：
- 支持 UIImage 输入
- 自动调整图片尺寸（长边上限 4096，长边下限 256）
- 同步/异步两种调用方式
- 返回压缩后的 Data、Image、Base64 数据

## 示例

见 `Example/` 目录下的示例项目。

## 系统要求

- iOS 10.0+
- Objective-C / Swift

## 安装

DeviceImpressTool 可通过 [CocoaPods](https://cocoapods.org) 安装。只需在 Podfile 中添加：

```ruby
pod 'DeviceImpressTool'
```

## 作者

crazyLuobo, yanwenbo_78201@163.com

## 许可证

DeviceImpressTool 基于 MIT 许可证开源，详见 LICENSE 文件。
