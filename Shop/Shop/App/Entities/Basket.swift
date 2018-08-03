import Foundation

class Basket {
    private static var goods: [GetGoodResult]
 = []
    
    static func count() -> Int {
        return goods.count
    }
    
    static func get(index: Int) -> GetGoodResult {
        return goods[index]
    }
    
    static func add(good: GetGoodResult) {
        goods.append(good)
    }
    
    static func remove(index: Int) {
        goods.remove(at: index)
    }
}
