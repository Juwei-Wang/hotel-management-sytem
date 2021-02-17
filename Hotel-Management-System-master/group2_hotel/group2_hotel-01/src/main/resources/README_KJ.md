# Hotel Management System (KevinJ Branch)
Mar 10th
1. 现已整合Spring IOC框架
2. 已导入Lombok支持,删除了pojo类的多余代码,
并加入了 @Data 注解。详情见pom.xml的导包,有网址。
3. 经查，sqlsession被spring-jdbc包中的SqlSessionTemplate类替代，且
SqlSession类可以帮我们自动关闭SqlSession，故在测试类中的try block的自动关闭代码已经不再需要。
4. Spring-jdbc接管事务后，不支持编程式事务下的手动提交，后期可以修改为声明式事务
5. 自动注入已实现（@Autowired)(\<context:annotation-config/>)
6. 注解@Alias和Mybatis-config.xml里的 type-Aliases 是重合的，已将各pojo类的@Alias注解取消

Mar 12th 1:00AM
1. 现以初步整合实现了注解方式的SpringMVC
2. 导入了web项目支持（右键项目选择了add framework support）
3. 加入了一个新的配置文件springmvc-servlet.xml，专门用于springmvc的配置，且已imported进application context中
4. 加入了Tomcat服务器支持，正在与项目整合push入github
5. 修复昨天可能出现了的serverTimeZone配置参数名的错误
###业务层（Service）
1. Search业务可能需要room表和roomType表分开


Mar 22th 4:40AM
2. Booking业务已创建，使用了新创建的VO类BookingInfo，用来接收前端信息
并在BookingController中调用对应Service类时被传递。

3. BookingMapper持久层方法缺少，由Haohu来补全

4. 测试类未完成,之后补全