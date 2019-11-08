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
                '',
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
