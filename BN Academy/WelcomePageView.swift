import SnapKit
import UIKit

final class PageContentViewController: UIViewController {
    
    private let page: WelcomePage
    private let isLastPage: Bool
    private let finishHandler: () -> Void
    
    init(page: WelcomePage, isLastPage: Bool, finishHandler: @escaping () -> Void) {
        self.page = page
        self.isLastPage = isLastPage
        self.finishHandler = finishHandler
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        let imageView = UIImageView(image: page.image)
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = page.text
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let stack = UIStackView(arrangedSubviews: [imageView, label])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        if isLastPage {
            let button = UIButton(type: .system)
            button.setTitle("Завершить", for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 16)
            button.addTarget(self, action: #selector(didTapFinish), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.heightAnchor.constraint(equalToConstant: 44),
                button.widthAnchor.constraint(equalToConstant: 150)
            ])
        }
    }
    
    @objc private func didTapFinish() {
        finishHandler()
    }
}

