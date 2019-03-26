# RxSWift


我们把用户一次又一次的点击 Button 看做是序列，通过调用 subscribe 来订阅这个点击事件，每次点击都会发射一个数据，作为订阅者的 subscribe 收到这个这个数据进行某些响应。
 
 	bRx 的基本概念，有观察者观察一个序列，每当序列发射值的时	
 	候，观察者根据序列做一些事情

 
 
观察者观察的序列

	序列发射值，观察者订阅序列，收到值，进行处理。
使用时要把正常的应该设置的代理设置为nil

	tableview.delegate = nil || 
	
	UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
	


## Observable 可被观察的序列

决策树： 创建序列的方式

特征序列 :

- single: success 产生一个单独的元素  error 错误
- Completable: 
   completed - 产生完成事件,没有产生元素 error - 产生一个错误
  适用于那种你只关心任务是否完成，而不需要在意任务返回值的情况 
- Maybe: 它介于 Single 和 Completable 之间，它要么只能发出一个元素，要么产生一个 completed 事件，要么产生一个 error 事件。
- Driver: 它主要是为了简化 UI 层的代码

  不会产生 error 事件、一定在 MainScheduler 监听（主线程监听）、共享状态变化

- ControlEvent 专门用于描述 UI 控件所产生的事件



# ReactorKit

	遵循 Reactor 协议即可定义一个 Reactor。这个协议需Y要定义三个
	类型：Action，Mutation 和 State。它也需要一个 initialState 属性。

Action: 代表用户行为

State: 代表页面状态

Mutation: 是 Action 和 State 的桥梁


	Reactor 通过两步将用户行为序列转换为页面状态序列：mutate() 和 reduce()。
	

# Other 点

1.  在swift中 do..while循环已经被 repeat...while 代替，原因：do在swift有特殊的含义
2.  swift 中的数字可以用 “_” 来让用户更容易看。
    eg: 1000000 可以写成 1_000_000
3.  代码后的注释符号// 与代码有两个空格距离
4.  如果表达式过长，下一行前面加2个缩进，如果换成多行，每一行都要加2个缩进
5. 过长的表达式还是建议重构代码，拆分为几个变量运算会好一点
6. 如果整个for 循环在函数体顶部只有一个if 判断，使用for where 替换
7. 禁止把修饰符提前 eg: case .normal(let rhl, let rhs)
8. 使用 tuple pattern 赋值的时候左边元素不能有标签
  let (a, b) = (x: 4, y: 5)

1. 函数响应式编程： 通过不同的构建函数，来创建所需要的数据序列，最后通过不同的方式来响应这个序列
2. 数据绑定（订阅）： 将可被监听的序列（数据序列）绑定到观察者（响应的控件）上
3. 代码中用的最多的是publishSubject 她可以作为观察者也可以作为被观察者，没有加以区分。所以项目中是在乱用
