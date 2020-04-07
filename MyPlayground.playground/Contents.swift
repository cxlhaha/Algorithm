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
 1. 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 思路: 在进行迭代并将元素插入到表中的同时，我们还会回过头来检查表中是否已经存在当前元素所对应的目标元素。如果它存在，那我们已经找到了对应解，并立即将其返回。
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dic = [Int: Int]()
    for (index, num) in nums.enumerated() {
        let cha = target - num
        if let chaIndex = dic[cha] {
            return [chaIndex, index]
        }
        dic[num] = index
    }
    return []
}
twoSum([3, 2, 4], 6)



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

