## 功能
用于个性化配置Helm Chart所需变量（定义在config.yaml文件中），从而定制启动相应的软件服务。

## monocular
Monocular依靠同步上游的YAML文件来展示Charts，因此其MongoDB无需设置为Persistent，每次添加新的Charts Repo时删除原部署的Chart，而后依据新的config.yaml重新部署Chart即可。

### 常见问题
1. 无法连接mongoDB，提示AuthenticationFailed: SCRAM authentication failed, storedKey mismatch
Have you run a helm upgrade on the chart? That might explain why chartsvc can't authenticate correctly with MongoDB, as helm upgrade will regenerate the secret for MongoDB (see helm/helm#3053). To get both MongoDB and chartsvc to pick up the new password, you delete the MongoDB pod and all the chartsvc pods so they all start up again with the regenerated password. Hope that helps!
总结：helm upgrade不能随意使用，很有可能导致部分PODs间连接异常，解决办法：删除所有PODs，让Kubernetes重新创建或者使用helm重新部署相应Charts。

2. 推荐配置
推荐`successfulJobsHistoryLimit: 1`设置为1，否则每个同步项都会在集群上默认留下3个Pods，变化不频繁的repo，无需设置Schedule.
```
sync:
  repos:
    - name: stable
      url: https://kubernetes-charts.storage.googleapis.com
      schedule: "0 * * * *"
      successfulJobsHistoryLimit: 1
    - name: incubator
      url: https://kubernetes-charts-incubator.storage.googleapis.com
      schedule: "*/5 * * * *"
      successfulJobsHistoryLimit: 1
    - name: monocular
      url: https://helm.github.io/monocular
      successfulJobsHistoryLimit: 1
    - name: choppy
      url: https://go-choppy.github.io/choppy-helm-charts
      successfulJobsHistoryLimit: 1
```

3. 无法显示README.md

![Not Found README](http://nordata-cdn.oss-cn-shanghai.aliyuncs.com/choppy/helm-charts-not-found-readme.png)

相应Chart压缩包中缺少`README.md`文件