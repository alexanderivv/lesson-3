 import UIKit


/*

 Конструкция guard

 func doSomethingWithPyramideOfDoom() {
     let isSomethingHappened = true
     if isSomethingHappened {
         print("do something")
     } else {
         return
     }
 }

 func doSomethingWithGuard() {
     let isSomethingHappened = true
     guard isSomethingHappened else { return }
     print("do something")
 }

 */




// Дополнительная литература
// https://swiftbook.ru/content/languageguide/collection-types/
// Здесь можно почитать про массивы.
// Так же, там есть еще два интересных типа данных - словари и множества.
// Их мы позже еще коснемся. Можно почитать, если хватит на это сил.





// MARK: -  Тема урока: Массивы. Кортежи -


/*
 Массивы
    - Синтаксис создания массива
    - Обращение к отдельному элементу массива по индексу - небезопасно, так как можем выйти за пределы массива
    - Перебор массива - цикл for-in
    - Добавление элемента в массив
 */

let point = (x: 1, y: 0, name: "name")  // кортеж содержит заранее известный набор разнотипных переменных. Доступ к элементам осуществляется по имени переменной, либо по индексу, если переменные внутри кортежа анонимные (без имени)
let point2 = [1, 0] // массив содержит набор однотипных элементов, которые можно добавлять и удалять в ходе выполнения программы. Доступ к элементам массива осуществляется по индексу


let arrayExample = [1, 2, 3, 4, 5, 6]


let arrayExampleMultipleLines = [
    1,
    2,
    3,  // <<< допускается запятая у последнего элемента
]

let arrayExample1: [Int] = []   // это просто пустой массив, то есть, в нем нет ни одного элемента
let arrayExample2: [Int] = [1, 2, 3]
//let arrayExample3 = [] // Почему тут xcode подсвечивает ошибку? Кто догадается?

let arrayExample4 = [Int]()

let arrayExample5 = [Int]([1, 2, 3])
let arrayExample6 = [Int](arrayLiteral: 1, 2, 3)

let arrayExample7 = [Int](repeating: 0, count: 5)

let arrayExample8 = Array<Int>()
let arrayExample9: Array<Int> = []
let arrayExample10: Array<Int> = [Int]()

let matrix = [[1, 2, 3], [4, 5, 6]]


// for loop
// break        - прерывает выполнение цикла
// continue     - переходит на следующую итерацию цикла

//for i in arrayExample {
//    if i % 2 == 0 {
//        print(i)
//        continue
////        print(i)
//    }
//    if i > 1 {
//        print(i)
//        break
////        print (i)
//    }
//    print(i)
//}

// while loop

arrayExample[0]
arrayExample[1]
arrayExample[2]

print("while")

var n = 10
while n < arrayExample.count {  // цикл while сперва проверяет условие выхода из цикла, а потом выполняет работу в теле цикла
    print(arrayExample[n])
    n += 1
}

// repeat while loop
print("repeat while")

print("arrayExample.count", arrayExample.count) // выводит количество элементов в массиве
print("arrayExample.lastIndex", arrayExample.count - 1) // обратить внимание, что нумерация элеменов начинается с 0

var r = 4
repeat {    // repeat сперва выполняет работу в теле цикла, а потом проверяет условие выхода из цикла
    print("hello")
    guard arrayExample.indices.contains(r) else {   // здесь мы проверяем, что индекс r действительно не выходит за границы массива
        continue    // continue и break есть как в for, так в while и repeat циклах
    }
    print(arrayExample[r])  // здесь мы обращаемся к элементу массива по индексу
    r += 1
} while r < arrayExample.count


// Функции высшего порядка

var myArray: [Int] = []

//arrayExample.append
myArray.append(1)   // добавляет новый элемент в конец цикла
myArray.append(10)

//myArray.insert(111, at: 1)
//myArray

//myArray.insert(111, at: 3) //error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
//myArray

//arrayExample.remove
myArray.remove(at: 0)   // удаляем элемент с указанным интексом и возвращает этот элемент
myArray.removeAll()

//arrayExample.contains
myArray.contains(10)    // проверяем, есть ли такой элемент в массиве. На выходе либо true либо false
myArray.contains(5)

//arrayExample.sort
myArray = [6,3,6,8,4,3,4,5,7]
myArray[0]  // это обращение к элементу массива по индексу. Опасно, потому как такого индекса может в массиве не быть
myArray[0] = 10 // а это изменение значения элемента массива по индексу
myArray

myArray.sort()  // сортировка по возрастанию
myArray.sort(by: <)

myArray.sort(by: { left, right in left > right }) // сортировка по убыванию с помощью кложуры (в ней можно придумать любой другой способ сортировки. например, по количеству цифр в числе, а не величине значения числа
myArray.sort(by: >)

var sortedArray = myArray.sorted()  // если sort() сортирует сам массив, над которым выполняется дейтсвите, то функция sorted() оставляет массив без изменений, а просто в качестве результирующего значения выводит отсортированный массив
sortedArray.reverse()   // инвертирует массив (выводит элементы в обратном порядке)
sortedArray

//arrayExample.filter
myArray
//let filteredArray = myArray.filter({ value in value % 2 == 0 })
let filteredArray = myArray.filter({ $0 % 2 == 0 }) // оставляет на выходе только те элементы, для которых кложура вернула true. Здесь $0 - это текущий элемент массива (фильтр перебирает элемент за элементом и для каждого выполняет эту кложуру и смотрит, если true, то оставляет элемент, если false - выкидывает его
filteredArray

//arrayExample.map
arrayExample
let mltArray = arrayExample.map({ $0 * 2 }) // преобразование массива. То есть, берем каждый элемент и заменяем его на результат работы этой кложуры. В данном случае, берем каждый элемент массива по очереди, умножаем на два и кладем обратно
mltArray

//arrayExample.flatMap
let flatArray = [ [1, 2, 3], [1], [4 ,5] ] // это массив массивов.
let flatArrayResult = flatArray.flatMap({ $0 }) // а так можно преобразовать масив массивов в простой плоский массив
flatArrayResult

//arrayExample.reduce
let reduceArray = [1, 2, 3, 4]
let sum = reduceArray.reduce(0, { result, element in result + element })    // result - это результат вычислений на предыдущем шаге. Element - текущий элемент массива. Результат вычисления result + element передается на следующий шаг итерации (то есть, этот результат попадет в переменную result следующего шага) Для самого первого элемента, в переменную result данной кложуры, попадет значение 0, то есть, то значение, которое мы указали первым параметром в методе reduce
sum



//arrayExample.max
//arrayExample.min

arrayExample
arrayExample.max()  // найти максимальный элемент массива
arrayExample.min()  // найти минимальный элемент массива


// домашнее задание
//Массив из кортежей - возвести Int в квадрат, отфильтровать только
//четные Int и упорядочить по строкам по возрастанию

var x = [(1, "x"), (4, "y"), (6, "a")]

let k = x.map({ $0.0 * $0.0 }).filter({ $0.0 % 2 == 0 }).sorted(by: { $0.1 > })// <- [(36, "a"), (16, "y)]
print (k)

