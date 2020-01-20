import UIKit

class AnimatingTabBarController: UITabBarController {}

// MARK: - UITabBarDelegate

extension AnimatingTabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animate(item: item)
    }

    private func animate(item: UITabBarItem) {
        // タブアイコンのImageViewを取得
        guard let view = item.value(forKey: "view") as? UIView,
            let imageView = view.value(forKey: "imageView") as? UIImageView else { return }

        let force: CGFloat = 0.5
        let duration: TimeInterval = 0.3

        // 拡大・縮小アニメーション
        let popAanimation = CAKeyframeAnimation()
        popAanimation.keyPath = "transform.scale"
        popAanimation.values = [0, 0.2*force, -0.125*force, 0.05*force, 0]
        popAanimation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        popAanimation.duration = CFTimeInterval(duration)
        popAanimation.isAdditive = true
        imageView.layer.add(popAanimation, forKey: "pop")

        // 回転アニメーション
        let swingAnimation = CAKeyframeAnimation()
        swingAnimation.keyPath = "transform.rotation"
        swingAnimation.values = [0, 0.25*force, -0.125*force, 0.06125*force, 0]
        swingAnimation.keyTimes = [0, 0.4, 0.6, 0.8, 1]
        swingAnimation.duration = CFTimeInterval(duration)
        swingAnimation.isAdditive = true
        imageView.layer.add(swingAnimation, forKey: "swing")
    }
}
