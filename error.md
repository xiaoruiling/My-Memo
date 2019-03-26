
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

