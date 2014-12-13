#!/usr/bin/env swift

/*
插入排序:
标记第一个元素为已排序的，记录为已排序位
从第二个元素起，依次与已排序位至0号位相比较
找到一个比该数小又比前一个数大的位置，则将这个数插入该位置，同时该位置及其后已
排序数后移
如果没有找到这样的位置则将该数插入到第一个位置
以此类推
*/

var list: [Int] = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]

println("before sort:\(list)")


func insertAndMove(inout list: [Int], opIndex: Int, targetIndex: Int) -> [Int] {
    let n = list[opIndex]
    //将targetIndex至opIndex-1位置的数都后移一位
    for var i=opIndex; i>targetIndex; i-- {
        list[i] = list[i-1]    
    }
    list[targetIndex] = n
    return list
}

//使用了输入输出参数，参数值将被改变，声明参数时增加inout关键字
func insertionSort(inout list: [Int]) -> [Int] {
    //标记第一个数为已排序数,记录下其位置
    var sortedIndex = 0
    //第二个数起，依次与0至已排序位的数相比
    for var index=1; index<list.count; index++ {
        //默认当前操作的未排序数比所有排序数都大，因此定义插入位置为-1
        var insertIndex = -1
        for var index2=sortedIndex; index2>=0; index2-- {
            //如果找到比当前位置的数大的，就更新一下插入位置
            if list[index2] > list[index] {
                insertIndex = index2
            }
        }
        //如果插入位置不为-1则进行移位和插入操作
        if insertIndex > -1 {
            insertAndMove(&list, index, insertIndex)    
        }
        sortedIndex++
    }    
    return list
}

//输入输出参数只能是变量，且变量名前要加&修饰
insertionSort(&list)
println("after sort:\(list)")
