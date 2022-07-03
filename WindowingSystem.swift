//  Created by Bahadir Etka Kilinc

struct Size: CustomStringConvertible{
    
    var width: Int = 80
    var height: Int = 60
   
    mutating func resize(newWidth: Int, newHeight: Int) {
        self.width = newWidth
        self.height = newHeight
    }
    var description: String{
        return "Size: (\(width) x \(height))"
    }
}
struct Position: CustomStringConvertible{
    
    var x: Int = 0
    var y: Int = 0
   
    mutating func moveTo(newX: Int, newY: Int) {
       self.x = newX
       self.y = newY
    }
    var description: String{
        return "Position: (\(x), \(y))"
    }
}
class Window {
   var title: String = "New Window"
   var screenSize = Size(width: 800, height: 600)
   var size = Size()
   var position = Position()
   var contents: String?
   
   func resize(to size: Size) {
       let width = max(1, min(screenSize.width - position.x, size.width))
       let height = max(1, min(screenSize.height - position.y, size.height))
      
       self.size.resize(newWidth: width, newHeight: height)
   }
   
   func move(to position: Position) {
       let x = max(0, min(screenSize.width - size.width, position.x))
       let y = max(0, min(screenSize.height - size.height, position.y))
       self.position.moveTo(newX: x, newY: y)
   }
   
   func update(title: String) {
       self.title = title
   }
   
   func update(text: String?) {
       self.contents = text
   }
   
    func display() -> String {
        let contentDescription = self.contents ?? "[This window intentionally left blank]"
        return "\(self.title)\n\(position.description), \(size.description)\n\(contentDescription)\n"
    }
}
var mainWindow: Window{
    let mainWindow = Window()
    mainWindow.title = "Main Window"
    mainWindow.resize(to: Size(width: 400, height: 300))
    mainWindow.move(to: Position(x: 100, y: 100))
    mainWindow.contents = "This is the main window"
    return mainWindow
}