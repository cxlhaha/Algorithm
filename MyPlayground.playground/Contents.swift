import UIKit

/**
 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

 示例 1：

 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3
 */
func findRepeatNumber(_ nums: [Int]) -> Int {
    var numSet = Set<Int>()
    for num in nums {
        if numSet.contains(num) {
            return num
        } else {
            numSet.insert(num)
        }
    }
    return -1
}
findRepeatNumber([2, 3, 1, 0, 2, 5, 3])

/**
 给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。请你设计一种算法，将图像旋转 90 度。
 不占用额外内存空间能否做到？
 示例 1:
 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],
 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 思路:先水平翻转,再主对角线翻转
 */
 func rotate(_ matrix: inout [[Int]]) {

 }

