axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
var fo = new Vue({
    el:"#f1",
    data:{
        cid:dpp.cid,
        cod:dpp.cod,
        typeTitle : "Room Type",
        emptyRoomTitle : "Empty Room Left",
        priceTitle : "Price",
    },
    methods : {
        retQuery:function(){
            console.log(dpp.cid);
            console.log(dpp.cod);
            var that = this;
            axios.post("room",{
                cid : dpp.cid,
                cod : dpp.cod
            }).then(
                function(response){
                    console.log(response);
                    console.log(response.data.data[0]);
                    // console.log(response.data.data[0].price);
                    // console.log(response.data.data[0].roomType);
                    //document.getElementById(price).innerHTML = response.data.data[0].price.toString();
                    //document.getElementById(roomType).innerHTML = response.data.data[0].roomType.toString();
                    //that.price = response.data.data[0].price;
                    //that.roomType = response.data.data[0].roomType;
                    localStorage.setItem("cid",dpp.cid);
                    localStorage.setItem("cod",dpp.cod);
                    tb.tableData = response.data.data;
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

        // submit:function(){
        //     //var that = this;
        //     this.$router.push({name:"About"});//,params:{tp = document.getElementById(tpp), pr = document.getElementById(prr)}})
        //     // axios.get("",{

        //     // }).then(
        //     //     function(response){
        //     //         console.log("lalala");
        //     //     },
        //     //     function(error){
        //     //         console.log(error);
        //     //     }
        //     // )
        // }
    }
})