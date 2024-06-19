//TypeScript Learning
//Author: ShanGouXuehui
//Date: 2024-6-19
//Git: https://github.com/ShanGouXueHui/PythonAlgorithm
//Find More Python Algorithm Cases: https://m.toutiao.com/is/iYSgcfwq/
//Personal Page: https://www.toutiao.com/c/user/token/MS4wLjABAAAAaW5663GHobdB_4icGBE0z2IJSWBSYeEAmoCfHTazjhTREfuBFo6wZCPR34-atRpn/?source=profile


//父类定义
class Fruit{
    //定义public属性，外部可访问; 也是默认的属性类别
    public name: string
    //定义protected属性，子类可访问
    protected unit_price: number
    //私有属性，仅类内可访问
    private fruit_flag: boolean
    //静态属性，使用类名即可访问
    static num_of_fruits = 0

    //使用构造函数构造对象实例，初始化属性；可以给默认值
    constructor(name: string, unit_price: number, fruit_flag: boolean = true){
        this.name = name
        this.unit_price = unit_price
        this.fruit_flag = fruit_flag
        //Fruit个数+1
        Fruit.num_of_fruits += 1
    }

    //打印实例对象的信息
    public fruit_info():string{
        //``用来执行表达式，${}中是变量，两者配合可以拼接字符串
        return `Fruit name is ${this.name} and unit_price is ${this.unit_price}.`
    }

}

//子类定义，从Fruit继承
class Watermelon extends Fruit{
    private color: string

    constructor(name: string, unit_price: number, color: string){
        super(name, unit_price)
        this.color = color
    }


    public watermelon_info():string{
        //``用来执行表达式，${}中是变量，两者配合可以拼接字符串
        return this.fruit_info() + ` and color is ${this.color}`
    }
}
//子类定义对象实例
let fruit_instance1 = new Watermelon('Water Melon with Green Color', 18, 'Green')
console.log(fruit_instance1.watermelon_info())

//父类定义对象实例
let fruit_instance2 = new Fruit('Grape with Purple Color', 22)
console.log(fruit_instance2.fruit_info())

//子类和父类共同影响的元素
console.log('共计的水果个数为：', Fruit.num_of_fruits)

//定义函数，使用关键字function
function multiply_by_two_num(x: number, y: number): number{
    return x*y
}

let unit_price: number = 22
let fruit_num: number = 10

console.log('multiply_by_two_num(x: number, y: number): number = ', multiply_by_two_num(unit_price, fruit_num))

//箭头函数，定义匿名函数
let noname_add_by_two_num = (xx: number, yy: number) => {
    return xx + yy
}
let ev_car_num: number = 22
let dissel_car_num: number = 10
console.log('noname_add_by_two_num = ', noname_add_by_two_num(ev_car_num, dissel_car_num))



enum sex {Boy = 'Boy', Girl = 'Girl'}
let male_person: sex = sex.Boy
//if...else if....else 语句在执行多个判断条件的时候很有用。else if，else均为可选
if (male_person == 'Boy'){
    console.log('if-else male_person is a Boy!')
}
else if (male_person == 'Girl'){
    console.log('if-else male_person is a Girl')
}
else{
    console.log('if-else male_person is a person')
}

let gender_person: string = 'Boy'
//switch 语句允许测试一个变量等于多个值时的情况。
switch(gender_person){
    case 'Boy':{
        console.log('switch male_person is a Boy!')
        break
    }
        
    case 'Girl' :{ 
        console.log('switch male_person is a Girl!')
        break
    }

    default: {
        console.log('switch male_person is a person')
    }
}



//Unknown, 在编程阶段还不清楚类型的变量指定一个类型
let unknown_value: unknown = 4;
console.log('unknown_value1：' + unknown_value);

unknown_value = '山狗4！'
console.log('unknown_value2：' + unknown_value);

//Void,当一个函数没有返回值时，使用void。
function void_func_sample(): void {
    console.log('这个函数返回值是void，无返回值！');
 }

//undefined,用于初始化变量为一个未定义的值; null表示对象值缺失
let not_confirmed_value: null | undefined;
not_confirmed_value = undefined; 
console.log('not_confirmed_value1:' + not_confirmed_value);
not_confirmed_value = null;   
console.log('not_confirmed_value2:' + not_confirmed_value);

//联合类型（Union Types，取值可以为多种类型中的一种。
let age: string | number;
age = 18;
console.log('数字age：' + age);
age = 'Eighteen';
console.log('字符串age：' + age);

//元组表示一组数据，各个数据的类型可以不同
//学生信息：姓名，ID，年龄
let studuent_info_set: [string, string, number];
studuent_info_set = ['小山', 'STU001', 22];
console.log('studuent_info_set1：' + studuent_info_set);
studuent_info_set = ['小狗', 'STU002', 21];
console.log('studuent_info_set2：' + studuent_info_set);

//枚举，枚举类型可以为一组数值赋予友好的名字。
enum gender {Boy, Girl};
let person: gender = gender.Boy;
console.log('gender：' + gender);
console.log('person: ' + person);




//数组
let prices: number[] = [11,22,33]
console.log('数字数组：' + prices)

let fruits: string[] = ['苹果', 'Orange', 'Grape']
console.log('字符串数组：' + fruits)


//布尔值，可以赋值为true或者false
let isGirl: boolean = true;

console.log('喜欢Girl吗：' + isGirl)

//TypeScript里的所有数字都是浮点数，这些浮点数的类型是 number。
//除了支持十进制，还支持二进制、八进制、十六进制。
let dec_num: number = 2
let binary_num: number = 10
let octal_num: number = 0o2
let hex_num: number = 0x2

console.log('dec_num：', dec_num)
console.log('binary_num：', binary_num)
console.log('octal_num：', octal_num)
console.log('hex_num：', hex_num)

//使用string表示文本数据类型，用双引号（ "）或单引号（'）表示字符串。
let author_sting: string = 'ShanGou XueHui!'
console.log('单引号author_sting: ', author_sting)
author_sting = "山狗学会!"
console.log('双引号author_sting: ', author_sting)


