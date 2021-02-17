var tb = new Vue({
    el:"#tb",
    data() {
        this.colConfigs = [
            {prop: 'roomType', label: 'Room Type'},
            {prop: 'emptyRoomsLeft', label: 'EmptyRoomsLeft'},
            {prop: 'price', label: 'Price'},
            /*{prop: 'submit', label: 'Operation'}*/
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
        handleEdit:function(index, row){
            console.log(index);
            console.log(row);
        },
        /*submit:function(Type){
            localStorage.setItem("cid",dpp.cid);
            localStorage.setItem("cod",dpp.cod);
            localStorage.setItem("tp",Type);
            location.href="bPage";
        },*/
        callChange:function (Type) {
            // localStorage.setItem("type",Type);
            dll.change(Type);
        }
    }
})