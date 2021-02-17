var dp = {
    data() {
        return {
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() > Date.now();
                }
            },
            cid: '',
            cod: ''
        };
    }
};
var Ctor = Vue.extend(dp)
var dpp = new Ctor().$mount('#dp')






