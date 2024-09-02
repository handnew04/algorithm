#Given a binary array nums, return the maximum number of consecutive 1's in the array.
#1 <= nums.length <= 105
#nums[i] is either 0 or 1.

class Solution(object):
    def findMaxConsecutiveOnes(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        count = 0
        maxCount = 0
        for num in nums:
            if num == 1:
                count += 1
            else:
                count = 0
            if count > 0 and maxCount < count:
                maxCount = count     
        return maxCount
        

#개선
class Solution(object):
    def findMaxConsecutiveOnes(self, nums):
        max_count = count = 0
        for num in nums:
            count = (count + num) * num
            if count > max_count:
                max_count = count
        return max_count