# flutter_data_flow

data-flow 是当时我做的一个简单的 demo，现在已经有：

* [React 版](https://github.com/riskers/data-flow)
* [Vue 版](https://github.com/riskers/data-flow-vue)
* [Angluar 版](https://github.com/riskers/ng-data-flow)

想不到现在又做了 Flutter 版的 [data-flow](https://github.com/riskers/flutter_data_flow)

包含:

* 基本组件如 Button / Image / ListView 的使用
* 路由
* 使用 statefulwidget 作为管理多页面状态的简单办法

做的时候，尝试使用 redux 来做的，但是觉得在 flutter 用 redux 还是太麻烦了，期待最佳实践，其他时候，还是用 statefulwidget 内的状态管理就行，实在不行就用 EventBus 管理！
