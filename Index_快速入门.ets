import defaultAppManager from '@ohos.bundle.defaultAppManager'
import continuationManager from '@ohos.continuation.continuationManager'
@Entry
@Component
struct Index {
  @State message: string = 'Hello 山狗学会！'
  build() {

    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}

//let声明变量
let val_test:string = 'first variable'
console.log('ShanGou val_test:' + val_test)
//const声明常量
const const_test:string = 'const variable'
console.log('Xuehui const_test:' + const_test)

//字符串类型(string)
let string_val1:string = 'ShanGou!'
let string_val2:string = `helloooo ${string_val1}`
console.log('ShanGouXuehui1, sting test, val_test:' + string_val2)

//数字类型(number)
let number_val1:number = 2
let number_val2:number = 9.999
let number_val3:number = number_val1 * number_val2
console.log('ShanGouXuehui1, number test, number_val3:' + number_val3)

//布尔值(boolean)
let boolean_val1 = true
console.log('ShanGouXuehui1, boolean test, boolean_val1:' + boolean_val1)


//Object类型,任何值都可以直接被赋给Object类型的变量
let object_val1:Object = number_val1
console.log('ShanGouXuehui1, object test, object_val1:' + object_val1)

//数组类型(Array)
let array_val1:string[] = ['banana','grape','watermelon']
console.log('ShanGouXuehui1, array test, array_val1:' + array_val1)

//枚举类型(enum),使用枚举常量时必须以枚举类型名称为前缀
enum enum_set {Yes, No}
let enum_val1 = enum_set.Yes
console.log('ShanGouXuehui1, enum test, enum_val1:' + enum_val1)

//联合类型(type),由多个类型组合成的引用类型
type union_type = number | string
let union_val:union_type = 'union_type = number | string'
console.log('ShanGouXuehui1, union test - string, union_val:' + union_val)
union_val = 22222
console.log('ShanGouXuehui1, union test - number, union_val:' + union_val)

//if...else if...else，条件表达式可以是任何类型。但是对于boolean以外的类型，会进行隐式类型转换
let if_string:string = 'hahaha'
let if_number:number = 0
let if_boolean:boolean = false
if (if_string){
  console.log('ShanGouXuehui2, if...else if...else, entered: ' + if_string)
}

if(if_number){
  console.log('ShanGouXuehui2, if...else if...else, entered: ' + if_number)
}
else if (if_boolean){
  console.log('ShanGouXuehui2, if...else if...else, entered: ' + if_boolean)
}
else {
  console.log('ShanGouXuehui2, if...else if...else, entered: defalt condition.')
}


//使用switch语句来执行与switch表达式值匹配的代码块。
let condition:Object = 2

switch (condition){
  case 'aaa':
    console.log('ShanGouXuehui3, switch, entered condition: aaa.')
    break
  case 2:
    console.log('ShanGouXuehui3, switch, entered condition: 2.')
  default:
    console.log('ShanGouXuehui3, switch, entered condition: default')
}

//条件语句，condition ? expression1 : expression2，如果condition的为真值，则返回expression1，否则expression2。
let exp_val1 = 2
let exp_val2 = 5
let exp_val3 = exp_val2 > exp_val1 ? exp_val2 : exp_val1
console.log('ShanGouXuehui4, 条件语句, exp_val3: ' + exp_val3)

//for语句,会被重复执行，直到循环退出语句值为false。
let add_till_10:number = 0
for(let i = 0; i <= 10; i += 1){
  add_till_10 += i
}
console.log('ShanGouXuehui5, 条件语句, add_till_10: ' + add_till_10)

//使用for-of语句可遍历数组或字符串
let fruits:string[] = ['banana','grape','watermelon']

for(let f of fruits){
  console.log('ShanGouXuehui6, for-of语句, f: ' + f)
}

//只要condition为真值（转换后为true的值），while语句就会执行statements语句。
let count:number = 2
let index:number = 0

while(index < 5){
  if(index == 0){
    index++
    continue
  }
  if(index == 4){
    index++
    break
  }
  count *= index
  index++
}
console.log('ShanGouXuehui7, while语句, count: ' + count)


//函数声明使用function关键字定义，它包含名称、参数列表、返回类型(可选)和函数体。
function add_numbers(val1:number, val2:number, val3:number[]):number{
  let sum:number = val1 + val2

  for(let n of val3){
    sum += n
  }

  return sum
}

let val1:number = 22
let val2:number = 33
let val3:number[] = [10, 20, 70]
console.log('ShanGouXuehui8, 函数, function add_numbers(22,33,100): ' + add_numbers(val1,val2,val3))
val3 = [10, 20, 70,100]
console.log('ShanGouXuehui8, 函数, function add_numbers(22,33,200): ' + add_numbers(val1,val2,val3))

//类，自定义类型，包含字段、方法，构造函数；支持继承、派生
//父类定义，通用属性
class Human{
  name:string
  gender:string
  static num_of_human:number = 0

  constructor(name:string, gender:string){
    this.name = name
    this.gender = gender
    Human.num_of_human += 1
  }

  sayHi():string{
    if(this.gender == 'male'){
      return 'hello Mr.' + this.name
    }
    else{
      return 'hello Ms.' + this.name
    }
  }
}
//子类定义，老师
class Teacher extends Human{
  private _type_of_teacher:string = 'math'
  set type_of_teacher(type_of_teacher:string){
    this._type_of_teacher = type_of_teacher
  }
  get type_of_teacher():string{
    return this._type_of_teacher
  }
}

let t1 = new Teacher('小王','male')
console.log('ShanGouXuehui9, 类, Teacher extends Human 1: ' + t1.sayHi() + ', 第几个人：' + Human.num_of_human)
let t2 = new Teacher('小李', 'female')
console.log('ShanGouXuehui9, 类, Teacher extends Human 2: ' + t2.sayHi() + ', 第几个人：' + Human.num_of_human)

//泛型Record<K, V>用于将类型（键类型）的属性映射到另一个类型（值类型），类似于Python中的字典
let arkts_dict: Record<string,number> = {
  '小张':19,
  '小雨':18,
}
console.log('ShanGouXuehui10, 字典, 小张的年龄: ' + arkts_dict['小张'])
console.log('ShanGouXuehui10, 字典, 小雨的年龄: ' + arkts_dict['小雨'])

