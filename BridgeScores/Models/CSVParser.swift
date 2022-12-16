//
//  CSVParser.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/13/22.
//
// From files at https://github.com/Nero5023/CSVParser
import Foundation


public class CSVParser {
  
  var content: String
  var _rows: [[String]]
  
  var rows: [[String]] {
    get {
      if let lastElement = _rows.last, lastElement == [""] {
        return Array(_rows.dropLast())
      }
      return _rows
    }
  }
  
  let hasHeader: Bool
  // config
  let delimiter: Character
  let lineSeparator: Character
  let quotes: Character = "\""
  
  var headers: [String] {
    get {
      if hasHeader {
        return self.rows.first ?? []
      }else {
        return []
      }
    }
  }


    /**
      Create a CSVParser from String
     - Parameters:
      - content: the CSV String to parse
      - delimiter: the delimiter of the csv string
      - lineSeparator: the line separator of the csv string
    */
    public init(content: String, delimiter: Character = ",", lineSeparator: Character = "\n", hasHeader: Bool = true) throws {
      self.content = content
      self.delimiter = delimiter
      self.lineSeparator = lineSeparator
      self._rows = []
      self.hasHeader = hasHeader
      try self.parse()
    }
    
    /**
     Create a CSVParser from String
     - Parameters:
       - content: the CSV String to parse
       - delimiter: the delimiter of the csv file
       - lineSeparator: the line separator of the csv file
     */
    public convenience init(filePath: String, delimiter: Character = ",", lineSeparator: Character = "\n") throws {
      let fileContent = try String(contentsOfFile: filePath)
      try self.init(content: fileContent, delimiter: delimiter, lineSeparator: lineSeparator)
    }
    
    /**
     Create a CSVParser from [[String]]
     - Parameters:
     - elements: the elements in the csv file
     - delimiter: the delimiter of the csv file
     - lineSeparator: the line separator of the csv file
     */
    public init(elements: [[String]], delimiter: Character = ",", lineSeparator: Character = "\n", hasHeader: Bool = true) {
      self.content = ""
      self.delimiter = delimiter
      self.lineSeparator = lineSeparator
      self._rows = elements
      self.hasHeader = hasHeader
    }
    
    /**
      Create an empty CSVParser, required by 'RangeReplaceableCollection'
      */
     public convenience required init() {
       self.init(elements:[[]])
     }
     
     public func wirite(toFilePath path: String) throws {
       try self.rows.map{ $0.joined(separator: String(self.delimiter)) }.joined(separator: String(self.lineSeparator)).write(to: URL(fileURLWithPath: path), atomically: false, encoding: .utf8)
     }
     
     
     public func enumeratedWithDic() -> [[String: String]] {
       return self.rows.dropFirst().map {
         var dic = [String: String]()
         for (index, word) in $0.enumerated() {
           dic[self.headers[index]] = word
         }
         return dic
       }
     }
     
     
     private func parse() throws {
       if let _ = self.content.range(of: String(self.quotes)) {
         // if the file contains quote '"'
         try self.parseWithQuotes()
       }else {
         // if the file not contain quote
         self.parserNoQuote()
       }
     }
       
    // MARK: CSV To JSON
    /**
     Convert csv to JSON
     
     The return json type
     [
     {
     "header0": "a",
     "header1": "b"
     },
     {
     "header0": "a",
     "header1": "b"
     }
     ]
     
     - Returns: the parsed json string
     */
    public func toJSON() throws -> String? {
      let dic = self.enumeratedWithDic()
      let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
      let jsonStr = String(data: jsonData, encoding: String.Encoding.utf8)
      return jsonStr
    }
    
    //MARK: JSON TO CSV
    /**
     Static method Convert Json to csv string
     You can use result to generate a CSVParser instance
     
     The json input now only suport this json type
     [
     {
     "header0": "a",
     "header1": "b"
     },
     {
     "header0": "a",
     "header1": "b"
     }
     ]
     
     - Parameter: jsonData: the json object with Data type.
     - Returns: the parsed CSV String
    */
    static public func jsonToCSVString(jsonData: Data) throws -> String {
      guard let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? Array<Dictionary<String, Any>> else {
        throw CSVParserError.jsonObjTypeNotMatch
      }
      let delimiter = ","
      let lineSeparator = "\n"
      if jsonObj.count == 0 {
        return ""
      }
      let header = jsonObj[0].keys
      let headerStr = header.dropFirst().reduce(header.first!) { result, col in
        result + delimiter + col
      }
      
      // help method
      // parse dic to a line of csv string
      func dicToStr(dic: [String: Any]) -> String {
        var result = lineSeparator
        for key in header {
          result = result + parseDicValue(value: dic[key]) + delimiter
        }
        result.remove(at: result.index(before: result.endIndex))
        return result
      }
      
      // help method
      // parse dic value to string
      func parseDicValue(value: Any?) -> String {
        if let value = value as? String {
          return value
        }else if let intValue = value as? Int {
          return String(intValue)
        }else if let floatValue = value as? Float {
          return String(floatValue)
        }
        return ""
      }
      
      let csvContent = jsonObj.reduce(headerStr) { (result, row) -> String in
        result + dicToStr(dic: row)
      }
      return csvContent
    }
    
    
  }


//MARK: Make a CSVParserIterator
public struct CSVParserIterator: IteratorProtocol {
  
  public typealias Element = [String]
  
  var rowsIterator: IndexingIterator<[[String]]>
  
  init(rows: [[String]]) {
    self.rowsIterator = rows.makeIterator()
  }
  
  
  public mutating func next() -> [String]? {
    return self.rowsIterator.next()
  }
  
}

//MARK: Comfirm to Sequence protocol
extension CSVParser: Sequence {
  public func makeIterator() -> CSVParserIterator {
    return CSVParserIterator(rows: self.rows)
  }
}


//MARK: Comfirm to Collection protocol
extension CSVParser: Collection {
  public typealias Index = Int
  public var startIndex: Index { return self.rows.startIndex }
  public var endIndex: Index {
    return self.rows.endIndex
  }
  
  public func index(after i: Index) -> Index {
    return self.rows.index(after: i)
  }
  
  /**
   The Int subscript
   - Returns: the ith row
  */
  public subscript(idx: Index) -> [String] {
    get {
      return self.rows[idx]
    }
    
    set (newValue) {
      self._rows[idx] = newValue
    }
  }
}

extension CSVParser {
  /**
   The String subscript
   - Returns: the column
   */
  public subscript(key: String) -> [String]? {
    guard let index = self.headers.firstIndex(of: key) else {
      return nil
    }
    // must parse first
    return self.rows.dropFirst().map {
      // make sure every column
      if index >= $0.count {
        return ""
      }else {
        return $0[index]
      }
    }
  }
}

extension CSVParser: RangeReplaceableCollection {
  public func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where C : Collection, C.Iterator.Element == Array<String> {
    self._rows.replaceSubrange(subrange, with: newElements)
  }
  public func reserveCapacity(_ n: Int) {
    self._rows.reserveCapacity(n)
  }
}

//From parser.swift
extension CSVParser {
  //if there is no quotes in content
  func parserNoQuote() {
    self._rows = self.content.nzSplitElements(lineSeparator: self.lineSeparator, delimiter: self.delimiter)
  }
  
  func parseWithQuotes() throws {
    let inputContents = content

    var cursor = inputContents.startIndex
    var nextDelimiter = inputContents.firstIndex(of: self.delimiter)
    var nextLine = inputContents.firstIndex(of: self.lineSeparator)
    var row = [String]()
    while true && cursor != inputContents.endIndex {
      
      // need to pares with quotes
      if inputContents[cursor] == quotes {
        var nextQuote = cursor
        cursor = inputContents.index(after: cursor)
        while true {
          if let nextQ = self.content.index(of: quotes, after: inputContents.index(after: nextQuote) ) {
            nextQuote = nextQ
            
            // end of file
            if nextQuote == inputContents.endIndex
                        || inputContents.index(after: nextQuote) == inputContents.endIndex {
              
                row.append(String(self.content[cursor..<nextQuote]))
              self._rows.append(row)
              return
            }
            
            // two quotes together
            if inputContents[inputContents.index(after: nextQuote)] == quotes {
              nextQuote = inputContents.index(after: nextQuote)
              continue
            }
            
            // come across delimiter
            if inputContents[inputContents.index(after: nextQuote)] == self.delimiter {
                row.append(String(self.content[cursor..<nextQuote]))
              cursor = inputContents.index(nextQuote, offsetBy: 1 + 1)
              // need to be the cursor next index
              
              nextDelimiter = self.content.index(of: self.delimiter, after: cursor)
              nextLine = self.content.index(of: self.lineSeparator, after: cursor)
              break
            }
            
            // come accross nextline
            if inputContents[inputContents.index(after: nextQuote)] == self.lineSeparator {
                row.append(String(self.content[cursor..<nextQuote]))
              self._rows.append(row)
              row.removeAll(keepingCapacity: true)
              //nextDelimiter = inputContents.suffix(from: cursor).index(of: self.delimiter)
              cursor = inputContents.index(nextQuote, offsetBy: 1 + 1)
              nextDelimiter = self.content.index(of: self.delimiter, after: cursor)
              nextLine = self.content.index(of: self.lineSeparator, after: cursor)
              break
            }
            
          }else {
            throw CSVParserError.containMismatchedQuotes
          }
        }
        continue
      }
      
      //Next delimiter comes before next newline
      if let nextDelim = nextDelimiter {
        if let nextLine = nextLine , nextDelim >= nextLine   {
          //pass
        }else {
            row.append(String(self.content[cursor..<nextDelim]))
          cursor = inputContents.index(nextDelim, offsetBy: 1)
          nextDelimiter = self.content.index(of: self.delimiter, after: cursor)
          continue
        }
      }
      
      // end of row
      if let nextNewLine = nextLine {
        row.append(String(self.content[cursor..<nextNewLine]))
        self._rows.append(row)
        row.removeAll(keepingCapacity: true)
        cursor = inputContents.index(nextNewLine, offsetBy: 1)
        
        nextLine = self.content.index(of: self.lineSeparator, after: cursor)
        
        continue
      }
      
      // the last element
      if cursor != inputContents.endIndex && nextDelimiter == nil && nextLine == nil {
        row.append(String(self.content[cursor..<self.content.endIndex]))
        self._rows.append(row)
        row.removeAll(keepingCapacity: true)
        cursor = self.content.endIndex
        
      }
      
      break
    }
  }
}

extension String {
  
  // split the string by character

  func split(by characterSet: CharacterSet) -> [String] {
    let quote = "\""
    var apperQuote = false
    let result = self.utf16.split(maxSplits: Int.max, omittingEmptySubsequences: false) { x in
      if quote == String(UnicodeScalar(x)!) {
        apperQuote = !apperQuote
      }
      if apperQuote {
        return false
      }else {
        return characterSet.contains(UnicodeScalar(x)!)
      }
      }.compactMap(String.init)
    return result
  }
  
  func split(by character: Character, quote: Character) -> [String] {
    var apperQuote = false
    let result = self.utf16.split(maxSplits: Int.max, omittingEmptySubsequences: false) { x in
      if String(quote) == String(UnicodeScalar(x)!) {
        apperQuote = !apperQuote
      }
      if apperQuote {
        return false
      }else {
        return Character(UnicodeScalar(x)!) == character
      }
      }.compactMap(String.init)
    return result
  }
  
  
  func parseCSV(delimiter: Character, lineSeparator: Character, quote: Character) -> [[String]] {
    var appearQuote = false
    let splitedLines = self.utf16.split(maxSplits: Int.max, omittingEmptySubsequences: false) {
      let char = Character(UnicodeScalar($0)!)
      if char == quote {
        appearQuote = !appearQuote
      }
      if appearQuote {
        return false
      }else {
        return char == lineSeparator
      }
    }
    appearQuote = false
    return splitedLines.map { line in
      line.split(maxSplits: Int.max, omittingEmptySubsequences: false) {
        let char = Character(UnicodeScalar($0)!)
        if char == quote {
          appearQuote = !appearQuote
        }
        if appearQuote {
          return false
        }else {
          return char == delimiter
        }
        }.compactMap(String.init)
    }
  }
  
}

//From stirng+extension.swift
extension String {
  // to split to lines
  func nzSplitLines(lineSeparator: Character) -> [String] {
    return self.utf16.split {
      Character(UnicodeScalar($0)!) == lineSeparator
      }.compactMap(String.init)
  }
  
  // to split to elements
  func nzSplitElements(delimiter: Character) -> [String] {
    return self.utf16.split {
      return Character(UnicodeScalar($0)!) == delimiter
      }.compactMap(String.init)
  }
  
  // from string to object data
  func nzSplitElements(lineSeparator: Character, delimiter: Character) -> [[String]] {
    let rowString =  self.utf16.split(maxSplits: Int.max, omittingEmptySubsequences: false) {
      Character(UnicodeScalar($0)!) == lineSeparator
    }
    return rowString.map {
      $0.split(maxSplits: Int.max, omittingEmptySubsequences: false) {
        Character(UnicodeScalar($0)!) == delimiter
        }.compactMap(String.init)
    }
  }
  
  func index(of char: Character, after: String.Index) -> String.Index? {
    return range(of: String(char), options: .literal, range: after..<self.endIndex, locale: nil)?.lowerBound
  }
  
  mutating func removeLast() -> Character {
    return self.remove(at: self.index(before: self.endIndex))
  }
  
}

//From error.swift
enum CSVParserError: Error {
  case jsonObjTypeNotMatch
  case containMismatchedQuotes
}

