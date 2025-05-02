import UIKit

class CustomButton: UIButton {
    
    init(title: String, hasBackground: Bool = false) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? UIColor(red: 1/255, green: 40/255, blue: 143/255, alpha: 1) : .clear
        
        self.layer.borderColor = hasBackground ? UIColor(red: 1/255, green: 40/255, blue: 143/255, alpha: 1).cgColor : UIColor.clear.cgColor
        
        let titleColor: UIColor = hasBackground ? .white : UIColor(red: 1/255, green: 40/255, blue: 143/255, alpha: 1)
        self.setTitle(title, for: .normal)
        
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
