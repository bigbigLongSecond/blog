# openApi 设计

openApi 应该具有的功能为：
1. 鉴权 
2. 赋值
3. 限流

## 鉴权

1. 通过apiSecret 和 corpId , 为客户绑定管理组（多态实现， 可以绑定管理组， 也可以绑定其他类型的信息），返回access_token
2. 通过access_token 鉴权，能解析到对应权限组，按照权限组，为参数动态赋值

## 赋值

返回对应access_token 的权限信息供内部业务使用

## 限流

对access_token 级别进行限流

---
##参考文档

[限流](https://developer.aliyun.com/article/1321740)
[使用guava进行api限流](https://blog.csdn.net/qq_34249468/article/details/131308630)
[]()
[]()
