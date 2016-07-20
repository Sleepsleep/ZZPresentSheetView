封装底部弹出view库，调用非常简单。

先来看下效果 

![配图](http://upload-images.jianshu.io/upload_images/954071-46806b606048fac6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![动图有点不清晰](http://upload-images.jianshu.io/upload_images/954071-4889b8f72ce025fe.gif?imageMogr2/auto-orient/strip)

gif不是很清晰 ，效果还是很酷的。运行和真机效果都不错，那么怎么使用呢，既然做成了库就要很方便的使用。

```
self.zz_presentSheetController(["去相册","举报他","分享用户"],clickItemHandler: {(index) in
                print(index)
            })
```

在vc中一句话，传入菜单数组就可以了和处理点击回调就可以了，回调传给你一个int的index，从0开始 0，1，2，3 。还有一个默认参数，完成回调 我默认赋值了nil，你也可以传闭包 。就是present完成的那个completion


![配图](http://upload-images.jianshu.io/upload_images/954071-5df38f5b9b3a99a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
使用的时候只要把图中标注的文件copy到项目中就可以直接一句话调用了。当然可以修改代码。比如sheet的背景色 ，文字的背景色 包括sheet的样式 随便修改啦。

github地址：https://github.com/smalldu/ZZPresentSheetView
参考地址：@ [bestswifter ](http://www.jianshu.com/users/3e55748920d2) 的 [iOS自定义转场动画实战讲解](http://www.jianshu.com/p/ea0132738057)
