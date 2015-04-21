// Playground - noun: a place where people can play

import UIKit

/*
Implement next permutation, which rearranges numbers into the lexicographically next greater permu- tation of numbers.
*/

func nextPermutation(a: [Int]) -> [Int] {
    var r = [Int](a)
    
    var t = 0, tIndex = 0
    for var i = r.count-1; i>=1; i-- {
        if r[i] > r[i-1] {
            t = r[i-1]
            tIndex = i-1
            break
        }
    }
    
    if tIndex==0 {
        return r.sorted(<)
    }
    
    for var i = r.count-1; i>tIndex; i-- {
        if r[i] > t {
            r[tIndex] = r[i]
            r[i] = t
            break
        }
    }
    
    return [Int](r[0...tIndex])+[Int](r[tIndex+1...r.count-1]).sorted(<)
}

nextPermutation([1,2,3])

nextPermutation([3,2,1])

nextPermutation([1,1,5])

nextPermutation([1,2,4,3])

nextPermutation([1,2,5,4,3])