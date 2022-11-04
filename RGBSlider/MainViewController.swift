//
//  MainViewController.swift
//  RGBSlider
//
//  Created by albik on 01.11.2022.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setBackgroundColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSetingsVC = segue.destination as? ColorSetingsViewController else { return }
        colorSetingsVC.colorSetings = view.backgroundColor
        colorSetingsVC.delegate = self
    }
}

// MARK: - Extension ColorSetingsDelegate

extension MainViewController: ColorViewControllerDelegate {
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
