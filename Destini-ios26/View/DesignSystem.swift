//
//  DesignSystem.swift
//  Destini-ios26
//
//  Created by Antigravity on 2025/12/28.
//

import UIKit

struct DesignSystem {
    
    struct Colors {
        static let glassBackground = UIColor(white: 1.0, alpha: 0.15)
        static let accentPrimary = UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0) // Futuristic Cyan-Blue
        static let textPrimary = UIColor.white
        static let textSecondary = UIColor.white.withAlphaComponent(0.7)
    }
    
    struct Fonts {
        static func futuristicTitle(size: CGFloat = 34) -> UIFont {
            if let font = UIFont(name: "AvenirNext-Bold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
        
        static func futuristicBody(size: CGFloat = 18) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
    }
    
    struct Layout {
        static let cornerRadius: CGFloat = 28.0 // Ultra rounded
        static let glassBlurStyle: UIBlurEffect.Style = .systemThinMaterialDark
    }
    
    static func applyGlassStyle(to view: UIView) {
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: Layout.glassBlurStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = Layout.cornerRadius
        blurEffectView.clipsToBounds = true
        blurEffectView.isUserInteractionEnabled = false
        
        view.insertSubview(blurEffectView, at: 0)
        
        view.layer.cornerRadius = Layout.cornerRadius
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
    }
}
