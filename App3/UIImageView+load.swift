//
//  UIImageView+load.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    func load(string: String) {
        
    }
}
