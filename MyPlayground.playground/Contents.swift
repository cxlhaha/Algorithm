import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}

struct Stack<Element> {
    fileprivate var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }
}

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
//twoSum([3, 2, 4], 6)


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
 3. 无重复字符的最长子串
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 思路: 滑动窗口
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    var str = ""
    var max = 0
    for char in s {
        while str.contains(char) {
            str.remove(at: str.startIndex)
        }
        str.append(char)
        max = max < str.count ? str.count : max
    }
    return max
}
//lengthOfLongestSubstring("fdasfds")


/**
 5. 最长回文子串
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：
 输入: "cbbd"
 输出: "bb"
 思路:扩展中心
 */
func longestPalindrome(_ s: String) -> String {
    if s.isEmpty {
        return ""
    }
    var maxStr = ""
    for (index, _) in s.enumerated() {
        let aTypeLength = longestPalindromeLength(s: s, leftIndex: index, rightIndex: index)
        let bTypeLength = longestPalindromeLength(s: s, leftIndex: index, rightIndex: index + 1)
        let length = max(aTypeLength, bTypeLength)
        if length > maxStr.count {
            let leftIndex = s.index(s.startIndex, offsetBy: index - length / 2 + 1 - length % 2)
            let rightIndex = s.index(leftIndex, offsetBy: length)
            maxStr = String(s[leftIndex..<rightIndex])
        }
    }
    return maxStr
}
func longestPalindromeLength(s: String, leftIndex: Int, rightIndex: Int) -> Int {
    var length = 0
    var left = leftIndex
    var right = rightIndex
        
    while left >= 0 && right < s.count && s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
        length = right - left + 1
        left -= 1
        right += 1
    }
    return length
}
//print(longestPalindrome("qwerwr"))


/**
 7. 整数反转
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 */
func reverse(_ x: Int) -> Int {
    var input = x
    var value = 0
    while input != 0 {
        let yushu = input % 10
        input = input / 10
        if value * 10 + yushu > Int32.max {
            return 0
        }
        if value * 10 + yushu < Int32.min {
            return 0
        }
        value = value*10 + yushu
    }
    return value
}
//reverse(12345)

/**
 11. 盛最多水的容器
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 说明：你不能倾斜容器，且 n 的值至少为 2。
 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 示例：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 */
func maxArea(_ height: [Int]) -> Int {
    if height.count < 2 {
        return 0
    }
    var leftIndex = 0
    var rightIndex = height.count-1
    var leftValue = height[leftIndex]
    var rightValue = height[rightIndex]
    
    var area = 0
    while leftIndex < rightIndex {
        let tempArea = min(leftValue, rightValue) * (rightIndex - leftIndex)
        area = max(area, tempArea)
        if leftValue < rightValue {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }
        leftValue = height[leftIndex]
        rightValue = height[rightIndex]
    }
    return area
}
//maxArea([1,8,6,2,5,4,8,3,7])

/**
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true
 */
func isValid(_ s: String) -> Bool {
    
    var symbolStack = Stack<Character>()
    enum Direction {
        case left
        case right
        
        static func getSymbolDirection(symbol: Character) -> Direction {
            switch symbol {
            case "{", "[", "(":
                return .left
            default:
                return .right
            }
        }
    }
    
    func isPair(left: Character, right: Character) -> Bool {
        if left == "{" && right == "}" {
            return true
        }
        if left == "[" && right == "]" {
            return true
        }
        if left == "(" && right == ")" {
            return true
        }
        return false
    }
    
    for char in s {
        let direction = Direction.getSymbolDirection(symbol: char)
        switch direction {
        case .left:
            symbolStack.push(char)
        case .right:
            guard let last = symbolStack.peek() else { return false }
            if isPair(left: last, right: char) {
                symbolStack.pop()
            } else {
                return false
            }
        }
    }
    if symbolStack.peek() == nil {
        return true
    }
    return false
}

//isValid("([])")




















/**
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 你可以假设 nums1 和 nums2 不会同时为空。
 示例 1:
 nums1 = [1, 3]
 nums2 = [2]
 则中位数是 2.0
 示例 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 则中位数是 (2 + 3)/2 = 2.5
 */




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
//findRepeatNumber([2, 3, 1, 0, 2, 5, 3])

