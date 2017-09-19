# GTMRefreshDemo
使用 GTMRefresh 实现 Swift 下拉刷新

![](https://img.shields.io/badge/platform-iOS-red.svg)
![](https://img.shields.io/badge/language-swift-orange.svg) 
![](https://img.shields.io/badge/download-5.7MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

字典作为无序的集合使用广泛，但是不乏极特殊情况下，我们需要对字典数据进行排序，至少保证展示时顺序的一致性，这里只提供一个思路，感觉功能实现很鸡肋。

| 名称 |1.列表页 |2.系统页 |3.块状页 |4.腾讯视频页 |5.雅虎天气页 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-19/6774902.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-19/27256787.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-19/22581215.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-19/70103330.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-9-19/46782397.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 系统级部件展示刷新效果 | CollectionView 使用刷新效果 | 腾讯视频样式自定义效果 | 雅虎天气样式自定义效果 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.实现优雅，结构清晰
* 3.基于 MJRefresh 设计，学习曲线好
* 4.具备较高自定义性

## Installation 安装
### 1.手动安装:
`下载Demo后,将功能文件夹拖入到项目中, 导入头文件后开始使用。`
### 2.CocoaPods安装:
修改“Podfile”文件
```
pod 'GTMRefresh'
```
控制台执行 Pods 安装命令 （ 简化安装：pod install --no-repo-update ）
```
pod install
```
> 如果 pod search 发现不是最新版本，在终端执行pod setup命令更新本地spec镜像缓存，重新搜索就OK了

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 引入头文件
```
import GTMRefresh
```
### 设置样式字述
```
self.tableView.tableFooterView = UIView(frame: CGRect.zero)

// text
self.tableView.pullDownToRefreshText("update now please")
    .releaseToRefreshText("hode on please")
    .refreshSuccessText("o~yes")
    .refreshFailureText("o~byebye")
    .refreshingText("I am going now")
    
// color
self.tableView.headerTextColor(.red)

// icon
self.tableView.headerIdleImage(UIImage.init(named: "someonePic"))
```
### 头尾相应调用
```
self.tableView.gtm_addRefreshHeaderView {
    [weak self] in
    print("excute refreshBlock")
    self?.refresh()
}

self.tableView.gtm_addLoadMoreFooterView {
    [weak self] in
    print("excute loadMoreBlock")
    self?.loadMore()
}
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
GTMRefreshDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
