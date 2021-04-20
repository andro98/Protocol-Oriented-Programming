import Foundation

// MARK:- Defining Protocol and Confirm to it
// Protocl Namin
// Start with a capital letter
// Noun + suffix to describe a capability

protocol Taggable{
    var tag: String { get set }
    var data: Data { get }
    static var counter: Int { get }
    
    mutating func update(data: Data) -> Bool
    static func incrementCounter()
    
    init(tag: String, data: Data)
}


struct TaggedData: Taggable{
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }
    
    static func incrementCounter() {
        counter += 1
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

// MARK:- Confirm to Protocol through Extensions
protocol Encrypting{
    func xor(key: UInt8) -> Self?
}

extension String: Encrypting{
    func xor(key: UInt8) -> String? {
        return String(bytes: self.utf8.map{ $0 ^ key}, encoding: .utf8)
    }
}

let source = "Andrew Maher"
let target = source.xor(key: 2)

// MARK:- Polymorphism

protocol Shape{
    var area: Double { get }
}

struct Rectangle: Shape{
    let width: Double
    let height: Double
    
    var area: Double{
        return width * height
    }
}

struct Circle: Shape{
    let raduis: Double
    
    var area: Double{
        return .pi * raduis * raduis
    }
}

let shapes: [Shape] = [
    Rectangle(width: 10, height: 20),
    Circle(raduis: 5)
]

for shape in shapes{
    print(shape.area)
}
