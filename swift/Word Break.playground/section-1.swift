// Playground - noun: a place where people can play

import UIKit

/*
Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
*/

extension String {
    subscript (i: Int) -> String {
    return String(Array(self)[i])
    }
    subscript (r: Range<Int>) -> String {
        return String(Array(self)[r])
    }
}

func wordBreak(s: String, dict: [String]) -> Bool {
    let strlen = countElements(s)
    
    var opt = [Bool](count: strlen+1, repeatedValue: false)
    opt[0] = true
    for var to=1;to<=strlen;to++ {
        opt[to] = reduce((0..<to), false, { (acc, n) -> Bool in
            return acc || (opt[n] && contains(dict, s[n..<to]))
        })
    }
    return opt.last!
}

wordBreak("leetcode", ["leet", "code"])
wordBreak("leetcode3", ["leet", "code"])
wordBreak("iambatman", ["i", "am", "bat", "man"])
wordBreak("cargo", ["car", "cargo", "go", "man"])
wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"])
