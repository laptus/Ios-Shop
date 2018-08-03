import Foundation
import UIKit

@IBDesignable
class MyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        setTitleColor(UIColor.blue, for: .normal)
        backgroundColor     = .white
        layer.cornerRadius  = frame.size.height/2
    }
}
