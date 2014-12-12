#!/usr/bin/env swift

/*
冒泡排序
*/

var list: [Int] = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]

println("before sort:\(list)")

//使用了输入输出参数，参数值将被改变，声明参数时增加inout关键字
func bubbleSort(inout list: [Int]) -> [Int] {
    for var index=0; index<list.count-1; index++ {
        for var index2=index+1; index2<list.count-1; index2++ {
            if list[index] > list[index2] {
                let tmp = list[index]
                list[index] = list[index2]
                list[index2] = tmp
            }
        }
    }    
    return list
}

//输入输出参数只能是变量，且变量名前要加&修饰
var newList = bubbleSort(&list)
println("after sort(new List):\(newList)")
println("after sort(origin list):\(list)")
