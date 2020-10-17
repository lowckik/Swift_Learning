import UIKit

//1. Решить квадратное уравнение.
func descriminant(a:Int,b:Int,c:Int){
    let d = (b*b)-4*(a*c)
    if(a>=1){
        if(d<0){
          print("Корней нет")
        } else if(d==0){
          let res = -b/2*a
          print(res)
        } else if(d>0){
          let sqr = sqrt(Double(d))
          let sq = Int(sqr)
          let res1 = (-(b)-sq)/(2*1)
          let res2 = (-(b)+sq)/(2*1)
          print(res1,res2)
        }
    }else{
        print("Число _a_ не может быть меньше 1")
    }
}

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
func  hypotTriangle(a:Float,b:Float){
    let h = (a*a)+(b*b)
    let area:Float = (a*b)/2
    let perim:Float = a+b+h
    print("Гипотенуза треугольнак равна: ",h)
    print("Площадь теругольника равна: ",area)
    print("Периметр треугольника равен: ",perim)
}

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
func countPersent(summ:Float,persent:Float){
    let currentPersent:Float = persent/100
    var res:Float = 0
    for i in 1...5 {
        res = res + (summ * currentPersent)
    }
    print("Сумма вашего вклада за 5 лет равна: ",res+summ)
}

descriminant(a: 3, b: 4, c: 10)
hypotTriangle(a: 3, b: 4)
countPersent(summ: 2000, persent: 10)

