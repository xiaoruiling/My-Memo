
# CocoaPods 命令

1. **安装CocoaPods**: `sudo gem install cocoapods`
2. **安装依赖库**: ` pod install ` 

```
每次运行pod install命令, 下载并安装新的pod时, 它会为
Podfile.lock文件中的每个pod写入已安装的版本. 此文件跟踪每个pod
的已安装版本并锁定这些版本(.lock命名因此而来).

当运行pod install，它只解析Podfile.lock中尚未列在其中的pod的依赖库.

对于已经在Podfile.lock中列出的pod, Podfile.lock不会尝试检查是否有更新的版本.

对于尚未在Podfile.lock中列出的pod, 会搜索与Podfile（如中所述pod ‘MyPod’, ‘~>1.2’）匹配的版本或最新的版本.


```

3. **更新依赖库**: ``` pod update ```

去查找最新的版本，然后更新，不管Podfile.lock 是否已经是最新版本

#### pod -Verbose  VS pod --update

```pod --verbose -no-repo-update```: 
 省略不必要的进行安装(确定本地有框架,不会去网上查询，速度要快一点)

```pod update --verbose --no-repo-update```: 
省略不必要的进行升级

4. **搜索依赖库**: ``` pod search xxxx ```
5. 
