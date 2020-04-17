import UIKit

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
 2. 两数相加
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let resultListNode = ListNode(0)
    var congigureListNode = resultListNode
    var p = l1
    var q = l2
    var carry: Int = 0
    
    while p != nil || q != nil || carry != 0{
        let sum = (p?.val ?? 0) + (q?.val ?? 0) + carry
        carry = sum / 10
        congigureListNode.next = ListNode(sum % 10)
        p = p?.next
        q = q?.next
        congigureListNode = congigureListNode.next ?? ListNode(0)
    }
    return resultListNode.next
}
//let l1 = ListNode(2)
//l1.next = ListNode(4)
//l1.next?.next = ListNode(3)
//
//let l2 = ListNode(5)
//l2.next = ListNode(6)
//l2.next?.next = ListNode(4)
//
//let result = addTwoNumbers(l1, l2)
//print(result?.val,result?.next?.val,result?.next?.next?.val)




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

