# Swift 知识点



1.  删除了一个OC 写的文件， 然后没有在header.h 里面删除，但是Xcode 又不提示哪里的问题
编译失败时，可能会出现这种提示Command CompileSwiftSources failed with a nonzero exit code，但是并没有明确指出问题的来源，此时可以通过在Build Setting里面自添加一条user-defined(备注：点击Level 边上的 + 号就可以添加)，属性为SWIFT_ENABLE_BATCH_MODE,值为NO。再次编译就能发现编译失败的真正原因。

2.  计算字符串长度的时候，有的时候会计算的不准确，但是用ceil(width) 就正确了
eg：
public func DYK_sizeOfString (_ string: String, constrainedToWidth width: CGFloat = CGFloat.greatestFiniteMagnitude, constrainedToHeight height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
return NSString(string: string).boundingRect(with: CGSize(width: width, height: height),
options: [.usesLineFragmentOrigin, .usesFontLeading],
attributes: [NSAttributedString.Key.font: self],
context: nil).size
}

width = ceil(UIFont.systemFont(ofSize: 14).DYK_sizeOfString(title).width)

3. tableview 刷新的某一行的时候会出现跳跃性的动画，可用下面的方法解决

UIView.setAnimationsEnabled(false)
projectTableView.reloadRows(at: [indexPath], with: .automatic)
UIView.setAnimationsEnabled(true)

4. weak指针实现的原理：

原理： 不对被引用的对象进行 retain， 而是利用哈希表对weak指针与被指向的对象进行标记、关联。当对象销毁释放内存管时通过之前的标记对weak指针地址进行查找,最后把weak指针的指向置为nil。

5. 宏 （macros）Swift 中是没有宏的，因为swift并没有引进预处理指令， 而是Swift 要求明确代码，避免代码混乱，而宏是破坏了这一原则，只能用全局函数或者变量来替代，避免代码混乱。但是一些简单的基本的还是能用的， if...elseif...else/ if Debug 

  ``` Declare simple macros as global constants, and translate complex macros into functions. ```
  #file  : 文件地址
  #function: 方法 
  #line: 行数
  
  ```
  func log(message: String,
    function: String = #function,
    file: String = #file,
    line: Int = #line) {

        let url = NSURL(fileURLWithPath: file)

        print("Message \"\(message)\" (File: \(url.lastPathComponent ?? "?"), Function: \(function), Line: \(line))")
}

```
6.   