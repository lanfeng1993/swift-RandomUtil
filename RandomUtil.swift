//
//  RandomUtils.swift
//  rpc
//  随机相关工具类
//  Created by 熊智亮 on 16/4/30.
//  Copyright © 2016年 熊智亮. All rights reserved.
//

import Foundation

public class RandomUtil{
    public enum LetterCase {
        case UpperCase
        case LowerCase
        case NORMAL
    }
    private enum Letters : String{
        case NumberOnly = "0123456789"
        case LettersOnly = "abcdefghijklmnopqrstuvwxyz"
        case NumberAndLetters = "abcdefghijklmnopqrstuvwxyz0123456789"
    }
    //获取指定长度随机字符串,length 需要大于1
    private static func getRandom(length : Int,letters : Letters) -> String?{
        guard length > 1 else{
            return nil
        }
        switch letters{
        case .NumberOnly:
            let base = Letters.NumberOnly.rawValue
            return getString(length, base: base)
        case .NumberAndLetters:
            let base = Letters.NumberAndLetters.rawValue
            return getString(length, base: base)
        case .LettersOnly:
            let base = Letters.LettersOnly.rawValue
            return getString(length, base: base)
        }
    }
    
    //根据基础字符串生成指定长度的随机字符串,内部使用,私有
    private static func getString(length : Int,base : String) -> String{
        var randomString = ""
        let count = base.characters.count
        for _ in 0..<length{
            let index = Int(arc4random()) % count
            let caseFlag = Int(arc4random()) % 2
            if caseFlag == 0 {
                randomString += base.substringWithRange(base.startIndex.advancedBy(index)..<base.startIndex.advancedBy(index+1)).uppercaseString
            }else{
                randomString += base.substringWithRange(base.startIndex.advancedBy(index)..<base.startIndex.advancedBy(index+1)).lowercaseString
            }
        }
        return randomString
    }
    
    
    //MARK: 获取指定长度字符串，可指定大小写或者大小写都有
    public static func getRandomString(length : Int , letterCase : LetterCase) -> String?{
        switch letterCase {
        case .NORMAL:
            return getRandom(length, letters: .LettersOnly)
        case .UpperCase:
            return getRandom(length, letters: .LettersOnly)?.uppercaseString
        case .LowerCase:
            return getRandom(length, letters: .LettersOnly)?.lowercaseString
        }
    }
    
    //MARK: 返回大小写字母都有的随机字符串
    public static func getRandomString(length : Int) -> String?{
        return getRandom(length, letters: .LettersOnly)
    }
    
    public static func getRandomNumber(length : Int) -> String?{
        return getRandom(length, letters: .NumberOnly)
    }
    
    public static func getRandomNumberAndLetters(length : Int) -> String?{
        return getRandom(length, letters: .NumberAndLetters)
    }
}