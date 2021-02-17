var dl = {
    data() {
        return {
            /*gridData: [{
                date: '2016-05-02',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄'
            }, {
                date: '2016-05-04',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄'
            }, {
                date: '2016-05-01',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄'
            }, {
                date: '2016-05-03',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1518 弄'
            }],*/
            dialogFormVisible: false,
            form: {
                cName: '',
                pNumber: '',
                email: '',
                tp: '',
                cid: '',
                cod: ''
            },
            formLabelWidth: '120px'
        };
    },
    methods:{
        change:function (Type) {
            this.form.cName = "lalala";//localStorage.getItem("cName");
            this.form.pNumber = "1234567890"//localStorage.getItem("pNum");
            this.form.email = "jia@jia"//localStorage.getItem("email");
            this.form.tp = Type;
            this.form.cid = localStorage.getItem("cid");
            this.form.cod = localStorage.getItem("cod");
            this.dialogFormVisible = true;
        },
        Submit:function () {
            console.log(this.form.cName);
            console.log(this.form.pNumber);
            console.log(this.form.email);
            console.log(this.form.tp);
            console.log(this.form.cid);
            console.log(this.form.cod);
            var that = this;
            axios.post("http://localhost:8080/group2_hotel_01_war_exploded/booking",{
                    checkInDate : that.form.cid,
                    checkOutDate : that.form.cod,
                    roomType : that.form.tp,
                    clientName : that.form.cName,
                    phoneNumber : that.form.pNumber,
                    email : that.form.email

            }).then(
                function(response){
                    console.log(response);
                    // console.log(response.data.data[0]);
                    // console.log(response.data.data[0].price);
                    // console.log(response.data.data[0].roomType);
                    // //document.getElementById(price).innerHTML = response.data.data[0].price.toString();
                    // //document.getElementById(roomType).innerHTML = response.data.data[0].roomType.toString();
                    // //that.price = response.data.data[0].price;
                    // //that.roomType = response.data.data[0].roomType;
                    // that.roomInfo = response.data.data;
                    that.$message({
                        message: 'Booking succeed!',
                        type: 'success'
                    });
                },
                function(error){
                    console.log(error);
                    that.$message.error({
                        message: 'Booking failed!',
                        type: 'success'
                    });
                }
            );
        }
    }
};
var dl1 = Vue.extend(dl)
var dll = new dl1().$mount('#dl')