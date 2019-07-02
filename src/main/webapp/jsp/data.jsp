<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugin/layui/css/layui.css" media="all">
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/plugin/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/json/demo.json'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 80, fixed: 'left', unresize: true, sort: true}
                , {field: 'name', title: '设备名', width: 120, edit: 'text'}
                , {field: 'model', title: '设备型号', width: 140, edit: 'text', sort: true}
                , {field: 'location', title: '位置', width: 120, edit: 'text'}
                , {field: 'peo', title: '处理人', width: 100}
                , {field: 'time', title: '处理时间', width: 120, sort: true}
                , {field: 'state', title: '处理状态', width: 120}
                , {field: 'number', title: '维修次数', width: 120, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 160}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'add':
                    layer.msg('增加');
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log(obj);
            if (obj.event === 'del') {
                layer.confirm('确定删除', function (index) {
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.prompt({
                    formType: 2
                    , value: data.state
                }, function (value, index) {
                    obj.update({
                        state: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>

</body>
</html>