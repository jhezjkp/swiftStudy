#!/usr/bin/env swift

/*
选择排序:
先过一遍找出最小的，与第一个交换位置
再找出第二小的，与第二交换位置
以此类推
*/

var list: [Int] = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]

println("before sort:\(list)")

//使用了输入输出参数，参数值将被改变，声明参数时增加inout关键字
func selectionSort(inout list: [Int]) -> [Int] {
    for var index=0; index<list.count; index++ {
        //假设当前位置最小
        var minIndex = index    
        for var index2=index+1; index2<list.count; index2++ {
            if list[minIndex] > list[index2] {
                minIndex = index2
            }
        }
        //如果最小的位置序号不是当前的序号则需要交换一下
        if index != minIndex {
            let tmp = list[index]
            list[index] = list[minIndex]
            list[minIndex] = tmp
        }
    }    
    return list
}

//输入输出参数只能是变量，且变量名前要加&修饰
selectionSort(&list)
println("after sort:\(list)")
