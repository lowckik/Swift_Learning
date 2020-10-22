import UIKit

//1. Написать функцию, которая определяет, четное число или нет
func checkEven(_ num: Int){
    if num % 2 == 0 {
            print("\(num) четное число")
    } else {
        print("\(num) нечетное число")
    }
}

//2. Написать функцию, которая определит делится ли число без остатка на 3.

func divisionByThree(_ num: Int){
    if num % 3 == 0 {
            print("\(num) делится на 3 без остатка")
    } else {
        print("\(num) делится на 3 с остатком")
    }
}

//3. Создать возврастающий массив из 100 чисел.
var a: Array<Int> = []
for i in 1...20{// 20 для удобства вывода в консоль. Тут должно быть 1...100 )))
    a.append(i)
}


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var ar = a.filter {$0 % 2 != 0 && $0 % 3 == 0}
    

//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
var arrayNum = [0,1]
func plusFibonachi(_ array: Array<Int>,_ num: Int){
    var newArray = array
    let index = array.count
    var a = array[index-2]
    var b = array[index-1]
    var count = 0
    while count < num{
    let c = a+b
        newArray.append(c)
        a=b
        b=c
    count += 1
    }
    print(newArray)
}


//6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
func getPrime(_ n: Int){
    let a = Array(1...n)
    var p = a.filter {$0 % 2 != 0 && $0 % 3 != 0}
    p = p.filter{$0 % 5 != 0 && $0 != 1}
    print([2,3,5] + p)
    print("func getPrime(_ n: Int){let a = Array(1...n)var p = a.filter {$0 % 2 != 0 && $0 % 3 != 0}p = p.filter{$0 % 5 != 0 && $0 != 1}print([2,3,5] + p)".count)
}



//Проверка
checkEven(1)
divisionByThree(4)
print(ar)
print(a)
plusFibonachi(arrayNum,9)
getPrime(100)


