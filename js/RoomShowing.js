//ajax库采用axios
var _vueThis = null;
//调试:打开浏览器控制台(F12),在代码中某行增加 debugger 即可调试
var vueData = {
    "datePicker": "",
    "tableList": [{}]
};
//注意:vueDate布局器系统变量,请勿更改 此行以上代码不要更改或删除//
var vueMethod = {
    focus: function(e) {
        try {} catch(e) {}
    },
    _fileUploadSuccess: function(res, file, fileList) {
        if (res.flag) {}
    }
};

//注意:vueMethod布局器自动维护的系统方法,请勿更改 此行以上代码不要更改或删除//
var vueMounted = function() {}


//注意:vueMounted布局器自动维护的页面加载后执行的方法,请勿更改 此行以上代码不要更改或删除//
var myMethod = {
    retQuery:function(){
        console.log(this.cid);
        console.log(this.cod);
        var that = this;
        axios.post("room",{
            cid : this.cid,
            cod : this.cod
        }).then(
            function(response){
                console.log(response);
                console.log(response.data.data[0]);
                console.log(response.data.data[0].price);
                console.log(response.data.data[0].roomType);
                //document.getElementById(price).innerHTML = response.data.data[0].price.toString();
                //document.getElementById(roomType).innerHTML = response.data.data[0].roomType.toString();
                //that.price = response.data.data[0].price;
                tb.tableData= response.data.data;
            },
            function(error){
                console.log(error);
            }
        );
    },

    submit:function(Type){
        localStorage.setItem("cid",this.cid);
        localStorage.setItem("cod",this.cod);
        localStorage.setItem("tp",Type);
        location.href="bPage";
    }
}
for (var key in myMethod) {
    vueMethod[key] = myMethod[key];
}
/*您自定义的变量,可以在此处覆盖vueData提供的变量 参照element ui文档*/
var myData = {
    cid:"",
    cod:"2020-10-12",
    roomInfo:[]
}
/*把您定义的数据覆盖布局器自动识别的变量*/
Object.assign(vueData, myData);
var _t = this;
var Ctor = Vue.extend({
    //提前绑定的变量
    data: function() {
        return vueData;
    },
    created: function() {
        _vueThis = this;
    },
    //页面加载完 会执行方法 可以做一些初始化操作
    mounted: vueMounted,
    /*当前页面绑定的方法集合 与布局器节点一一映射即可 参照element ui文档*/
    methods: vueMethod
});
var Ctor1 = Vue.extend({
    //提前绑定的变量
    /*data: function() {
        return vueData;
    },
    created: function() {
        _vueThis = this;
    },*/
    //页面加载完 会执行方法 可以做一些初始化操作
    mounted: vueMounted,
    /*当前页面绑定的方法集合 与布局器节点一一映射即可 参照element ui文档*/
    /*methods: vueMethod*/
});
new Ctor1().$mount('#H3');
new Ctor().$mount('#dp');
/*
new McECharts().render();*/

var tb = new Vue({
    el:"#tb",
    data() {
        this.colConfigs = [
            {prop: 'roomType', label: 'Room Type'},
            {prop: 'emptyRoomsLeft', label: 'EmptyRoomsLeft'},
            {prop: 'price', label: 'Price'},
            {prop: 'submit', label: '', }
        ]
        return {
            tableData: []/*{
                date: '2016-05-02',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄'
            }, {
                date: '2016-05-04',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1517 弄'
            }*/
        }
    },
    methods : {

    }
})
