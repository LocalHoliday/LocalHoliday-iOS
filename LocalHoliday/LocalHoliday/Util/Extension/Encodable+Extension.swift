//
//  Encodable+Extension.swift
//  LocalHoliday
//
//  Created by 정종인 on 2023/07/08.
//

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            if let dictionary = jsonObject as? [String: Any] {
                return processDictionary(dictionary)
            }
            return [:]
        } catch {
            return [:]
        }
    }

    private func processDictionary(_ dictionary: [String: Any]) -> [String: Any] {
        var processedDictionary: [String: Any] = [:]
        
        for (key, value) in dictionary {
            if let nestedDictionary = value as? [String: Any] {
                processedDictionary[key] = processDictionary(nestedDictionary)
            } else if let nestedArray = value as? [Any] {
                processedDictionary[key] = processArray(nestedArray)
            } else {
                processedDictionary[key] = value
            }
        }
        
        return processedDictionary
    }

    private func processArray(_ array: [Any]) -> [Any] {
        var processedArray: [Any] = []
        
        for value in array {
            if let nestedDictionary = value as? [String: Any] {
                processedArray.append(processDictionary(nestedDictionary))
            } else if let nestedArray = value as? [Any] {
                processedArray.append(processArray(nestedArray))
            } else {
                processedArray.append(value)
            }
        }
        
        return processedArray
    }

}
