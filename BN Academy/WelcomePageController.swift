import UIKit

struct WelcomePage {
    let image: UIImage
    let text: String
}

final class WelcomePageController: UIPageViewController {
    private let pages: [WelcomePage] = [
        WelcomePage(image: .welcomePageImage1, text: "ЕНТ•КТ \nПодготовка к экзаменам"),
        WelcomePage(image: .welcomePageImage2, text: "В сфере образовании с \n2014 года."),
        WelcomePage(image: .welcomePageImage3, text: "98% наших студентов — \nстипендиаты!"),
        WelcomePage(image: .welcomePageImage4, text: "+ 15 000 студентов \n4 школы")
    ]
    
    private lazy var controllers: [UIViewController] = {
            pages.enumerated().map { (index, page) in
                let isLast = index == pages.count - 1
                return PageContentViewController(page: page, isLastPage: isLast, finishHandler: {
                    self.finishOnboarding()
                })
            }
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            dataSource = self
            view.backgroundColor = .white
            setViewControllers([controllers[0]], direction: .forward, animated: false)
        }
        
        private func finishOnboarding() {
            print("Переход в главное меню")
        }
}


extension WelcomePageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index < controllers.count - 1 else { return nil }
        return controllers[index + 1]
    }
}
