//前端的组件源
let Year=['2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020'];
export function  mockData(index){
    let data = [];
    for (let i = 0; i <index; i++) {
        data.push({
            delete:'delete',
            name: 'John Brown'+Math.ceil(Math.random ()*10+1),
            age: Math.ceil(Math.random ()*10+1),
            sex:Math.ceil(Math.random ()*10+1)>5? '男':'女',
            birthDate: Year[Math.ceil(Math.random ()*10)]+'-10'+'-03',
            createDate:Year[Math.ceil(Math.random ()*10)]+'-10'+'-03',
            id:'src'+Math.ceil(Math.random ()*10+1),
            salary:Math.ceil(Math.random ()*100000+1)+','+'00',
            department:'天上人间'+Math.ceil(Math.random ()*10+1)+'部',
            account:Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+Math.ceil(Math.random ()*10+1)+'@'+'.com.cn'
        })
    }
    return data
}//假数据
export function  tableExpand(index){
    let data = [];
    for (let i = 0; i <index; i++) {
        data.push({
            name: 'John Brown'+Math.ceil(Math.random ()*10+1),
            age: Math.ceil(Math.random ()*100+1),
            address: 'New York No. 1 Lake Park',
            job: 'Data'+Math.ceil(Math.random ()*10+1),
            interest: 'badminton'+Math.ceil(Math.random ()*10+1),
            birthday: Year[Math.ceil(Math.random ()*10)]+'-10'+'-03',
            book: 'Steve Jobs'+Math.ceil(Math.random ()*10+1),
            movie: 'The Prestige'+Math.ceil(Math.random ()*10+1),
            music: 'I Cry'+Math.ceil(Math.random ()*10+1)
        })
    }
    return data
}//假数据
//  页面主页page_index
export function  pageHome(_index){
    let data = [];
    let index=_index;
    if(index==null|index==undefined|index==''|index==NaN|index==0){
        index=1;
    }
    for (let i = 0; i <index; i++) {
        data.push({
            name: 'John Brown'+Math.ceil(Math.random ()*10+1),
            age: Math.ceil(Math.random ()*100+1),
            address: 'New York No. 1 Lake Park',
            job: 'Data'+Math.ceil(Math.random ()*10+1),
            interest: 'badminton'+Math.ceil(Math.random ()*10+1),
            birthday: Year[Math.ceil(Math.random ()*10)]+'-10'+'-03',
            book: 'Steve Jobs'+Math.ceil(Math.random ()*10+1),
            movie: 'The Prestige'+Math.ceil(Math.random ()*10+1),
            music: 'I Cry'+Math.ceil(Math.random ()*10+1),
            result:[
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: '李明'},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: "吴刚"},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: '李兰英'},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: "阿比鹿"},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: '李明'},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: "吴刚"},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: '李兰英'},
                { title:'内容文字系统报错系统报错系统报错系统报错',createTime:'2019-08-16 09:30:08 ',name: "阿比鹿"},
            ],
            News:[
                '看媒体怎样报道交水建',
                '湖南路桥中标新化资江四桥渡桥中标新化资江四桥渡资江标新化资标新化资标新化资，哦啊啊啊哈哈哈',
                '尚上公司纪委对基层项目开展公司纪委对基层项目开展项目',
                '集团纪检调研湘潭扶贫公路项目',
                '常祁二标项目石灰石招标公告',
                '早春开门红 海外传捷报 集团早春开门红 海外传捷报 集团',
                '集团召开衡永高速项目前期工集团召开衡永高速项目前期标新化资新化资标新化资工,哦哈哈哈哈哈哈哈哈哈 去监听这个 属性值的变化，如果发生变化则讲这 去监听这个 属性值的变化，如果发生变化则讲这 去监听这个 属性值的变化，如果发生变化则讲这 去监听这个 属性值的变化，如果发生变化则讲这',
                '看媒体怎样报道交水建'
            ],
            tips:{
               sting1:{
                   warn:Math.ceil(Math.random ()*1000+1),
                   ok:Math.ceil(Math.random ()*1000+1),
               },
                sting2:{
                    warn:Math.ceil(Math.random ()*1000+1),
                    ok:Math.ceil(Math.random ()*1000+1),
                },
                sting3:{
                    warn:Math.ceil(Math.random ()*1000+1),
                    ok:Math.ceil(Math.random ()*1000+1),
                },
                sting4:{
                    warn:Math.ceil(Math.random ()*1000+1),
                    ok:Math.ceil(Math.random ()*1000+1),
                }
            }

        })
    }
    return data
}//假数据
//穿梭框
export function  MockData () {
    let mockData = [];
    for (let i = 1; i <= 20; i++) {
        mockData.push({
            key: i.toString(),
            label: 'Content ' + i,
            description: 'The desc of content  ' + i,
            disabled: Math.random() * 3 < 1
        });
    }
    return mockData;
}

export function targetKeys (item) {
    return item.filter(() => Math.random() * 2 > 1).map(item => item.key);
}
